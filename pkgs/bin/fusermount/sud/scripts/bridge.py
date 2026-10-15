#!/bin/python3 -I
"""Pass fusermount's inherited descriptors across the local SSH-based sudo."""
import array
import json
import os
import pwd
import secrets
import socket
import struct
import subprocess
import sys
import time

BACKEND = '/bin/fusermount-sud-backend'
BRIDGE = '/bin/fusermount-sud'
LIMIT = 65536


def credentials(sock):
    return struct.unpack('3i', sock.getsockopt(socket.SOL_SOCKET, socket.SO_PEERCRED, 12))


def receive(sock):
    data, ancillary, flags, _ = sock.recvmsg(
        LIMIT, socket.CMSG_SPACE(5 * array.array('i').itemsize), socket.MSG_CMSG_CLOEXEC)
    fds = []
    try:
        for level, kind, value in ancillary:
            if level == socket.SOL_SOCKET and kind == socket.SCM_RIGHTS:
                values = array.array('i')
                values.frombytes(value)
                fds.extend(values)
        if flags & (socket.MSG_TRUNC | socket.MSG_CTRUNC):
            raise ValueError('truncated request')
        args = json.loads(data)
        if (not isinstance(args, list) or not args
                or not all(isinstance(arg, str) and '\0' not in arg for arg in args)):
            raise ValueError('invalid argument vector')
        if len(fds) not in (4, 5):
            raise ValueError('expected stdio, cwd and optional FUSE control descriptor')
        return args, fds
    except BaseException:
        for fd in fds:
            os.close(fd)
        raise


def root_side(name):
    if os.geteuid() != 0:
        raise PermissionError('receiver must be started through sudo')
    if (not name.startswith('fusermount-sud-') or len(name) > 100
            or not all(c in 'abcdefghijklmnopqrstuvwxyz0123456789-' for c in name)):
        raise ValueError('invalid rendezvous name')
    with socket.socket(socket.AF_UNIX, socket.SOCK_SEQPACKET) as sock:
        sock.settimeout(30)
        sock.connect('\0' + name)
        _, uid, gid = credentials(sock)
        args, fds = receive(sock)
    # UID/GID come from the kernel's socket credentials, never the payload.
    user = pwd.getpwuid(uid)
    os.initgroups(user.pw_name, gid)
    os.fchdir(fds[3])
    for target, fd in enumerate(fds[:3]):
        os.dup2(fd, target, inheritable=True)
    env = {'PATH': '/bin', 'HOME': user.pw_dir, 'USER': user.pw_name,
           'LOGNAME': user.pw_name}
    if len(fds) == 5:
        os.set_inheritable(fds[4], True)
        env['_FUSE_COMMFD'] = str(fds[4])
    for fd in fds[:4]:
        os.close(fd)
    # Reproduce fusermount's usual real/effective IDs without a setuid file.
    # This preserves mount ownership and upstream permission checks.
    os.setresgid(gid, gid, gid)
    os.setresuid(uid, 0, 0)
    os.execve(BACKEND, ['fusermount', *args], env)


def user_side(args):
    if os.geteuid() == 0 or args in (['--version'], ['-V'], ['--help'], ['-h']):
        os.execve(BACKEND, ['fusermount', *args], os.environ.copy())
    data = json.dumps(args).encode()
    if len(data) > LIMIT:
        raise ValueError('argument vector too large')
    user = pwd.getpwuid(os.getuid())
    env = {'HOME': user.pw_dir, 'USER': user.pw_name, 'LOGNAME': user.pw_name,
           'PATH': '/bin', 'TMPDIR': '/tmp'}
    # Arc supplies only _FUSE_COMMFD in its helper environment. In particular,
    # HOME/PATH cannot be assumed to be set here.
    name = f'fusermount-sud-{os.getuid()}-{secrets.token_hex(16)}'
    with socket.socket(socket.AF_UNIX, socket.SOCK_SEQPACKET) as listener:
        listener.bind('\0' + name)
        listener.listen(1)
        listener.settimeout(0.2)
        child = subprocess.Popen(['/bin/sudo', BRIDGE, '--receive', name],
                                 env=env, stdin=subprocess.DEVNULL)
        try:
            deadline = time.monotonic() + 30
            while True:
                try:
                    peer, _ = listener.accept()
                except socket.timeout:
                    if child.poll() is not None:
                        return child.returncode or 1
                    if time.monotonic() >= deadline:
                        raise TimeoutError('sudo did not connect within 30 seconds')
                    continue
                with peer:
                    if credentials(peer)[1] != 0:
                        if time.monotonic() >= deadline:
                            raise TimeoutError('no authenticated root peer')
                        continue
                    cwd = os.open('.', os.O_RDONLY | os.O_DIRECTORY | os.O_CLOEXEC)
                    try:
                        fds = [0, 1, 2, cwd]
                        control = os.environ.get('_FUSE_COMMFD')
                        if control is not None:
                            fds.append(int(control))
                        count = peer.sendmsg([data], [(socket.SOL_SOCKET, socket.SCM_RIGHTS,
                                                     array.array('i', fds))])
                        if count != len(data):
                            raise RuntimeError('incomplete descriptor handoff')
                    finally:
                        os.close(cwd)
                    break
            # Do not keep an extra copy of Arc's control endpoint. The real
            # backend owns it now and implements the normal auto_unmount loop.
            if control is not None:
                os.close(int(control))
            return child.wait()
        except BaseException:
            if child.poll() is None:
                child.terminate()
                try:
                    child.wait(timeout=5)
                except subprocess.TimeoutExpired:
                    child.kill()
                    child.wait()
            raise


def main():
    try:
        if len(sys.argv) == 3 and sys.argv[1] == '--receive':
            root_side(sys.argv[2])
        else:
            return user_side(sys.argv[1:])
    except (OSError, ValueError, RuntimeError) as exc:
        print(f'fusermount-sud: {exc}', file=sys.stderr)
        return 1


if __name__ == '__main__':
    sys.exit(main())
