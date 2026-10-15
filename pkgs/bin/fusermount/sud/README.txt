fusermount through Stalix sud, without setuid files or a separate daemon.

The fusermount wrapper creates a random abstract Unix SOCK_SEQPACKET socket
and invokes /bin/sudo /bin/fusermount-sud --receive NAME. Only the generated
socket name goes through sud's SSH command string. The argument vector and
stdio/cwd/_FUSE_COMMFD descriptors travel through SCM_RIGHTS, not the shell.
The client requires a root peer. The receiver obtains the user's UID/GID
from SO_PEERCRED, restores that real identity with effective UID 0, and
executes /bin/fusermount-sud-backend with a clean environment.

The backend is FUSE 2.9.9 with one change: it opens /dev/fuse while privileged.
Mountpoint checks, user_id/group_id, option restrictions, unmount checks,
descriptor delivery and auto_unmount remain in upstream fusermount. Its
package mode is 0755 (0555 after normal ix finalization), with no setuid bit.
No device permissions, root-owned copies or long-running broker are needed.

The original control socket is passed intact. The backend sends the FUSE
device descriptor directly to the filesystem daemon and waits for its
control socket to close when auto_unmount is enabled. The sud invocation
then lasts as long as that upstream watcher. Help/version run without sudo.

Prerequisites: Linux, a working local Stalix sud configuration, and the
caller and sud server in the same network namespace (abstract Unix sockets).
The mount occurs in sud's mount namespace. This package is for mounting on
the host, not for escaping a sandbox or granting new sudo authorization.

Layout:
  bin/fusermount/sud/backend  native helper; no setuid installation
  bin/fusermount/sud/scripts  Python descriptor bridge
  bin/fusermount/sud          runtime dependency hub

Protocol tests (no root or mounts):
  python3 -B pkgs/bin/fusermount/sud/scripts/test_bridge.py
