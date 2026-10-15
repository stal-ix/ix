#!/usr/bin/env python3
"""Descriptor protocol tests; no sudo, mount or privileged operations."""
import array
import importlib.util
import json
import os
from pathlib import Path
import socket
import unittest

spec = importlib.util.spec_from_file_location('bridge', Path(__file__).with_name('bridge.py'))
bridge = importlib.util.module_from_spec(spec)
spec.loader.exec_module(bridge)


class DescriptorProtocol(unittest.TestCase):
    def test_control_socket_survives_handoff_and_closes(self):
        sender, receiver = socket.socketpair(socket.AF_UNIX, socket.SOCK_SEQPACKET)
        arc, helper = socket.socketpair()
        null = os.open('/dev/null', os.O_RDWR)
        cwd = os.open('.', os.O_RDONLY | os.O_DIRECTORY)
        received = []
        try:
            args = ['-o', 'auto_unmount,rw', '--', '/tmp/spaces;$(literal)`name`']
            fds = array.array('i', [null, null, null, cwd, helper.fileno()])
            sender.sendmsg([json.dumps(args).encode()], [(socket.SOL_SOCKET, socket.SCM_RIGHTS, fds)])
            actual, received = bridge.receive(receiver)
            self.assertEqual(actual, args)
            self.assertTrue(all(not os.get_inheritable(fd) for fd in received))
            self.assertEqual(os.fstat(cwd).st_ino, os.fstat(received[3]).st_ino)
            helper.close()
            # The transferred endpoint is the original socket, not a byte relay.
            os.write(received[4], b'ready')
            self.assertEqual(arc.recv(5), b'ready')
            os.close(received.pop())
            arc.settimeout(1)
            self.assertEqual(arc.recv(1), b'')
        finally:
            for fd in received:
                os.close(fd)
            for sock in [sender, receiver, arc, helper]:
                sock.close()
            os.close(null)
            os.close(cwd)

    def test_rejects_malformed_or_truncated_packets_without_fd_leaks(self):
        null = os.open('/dev/null', os.O_RDWR)
        try:
            for payload, count in [(b'not-json', 4), (b'[]', 4),
                                   (b'[1]', 4), (b'["ok"]', 3),
                                   (b'["ok"]', 8), (b'x' * (bridge.LIMIT + 1), 4)]:
                with self.subTest(payload=payload[:20], descriptors=count):
                    sender, receiver = socket.socketpair(socket.AF_UNIX, socket.SOCK_SEQPACKET)
                    try:
                        before = len(os.listdir('/proc/self/fd'))
                        sender.sendmsg([payload], [(socket.SOL_SOCKET, socket.SCM_RIGHTS,
                                                   array.array('i', [null] * count))])
                        with self.assertRaises(ValueError):
                            bridge.receive(receiver)
                        self.assertEqual(before, len(os.listdir('/proc/self/fd')))
                    finally:
                        sender.close()
                        receiver.close()
        finally:
            os.close(null)

    def test_peer_credentials_are_kernel_supplied(self):
        left, right = socket.socketpair()
        try:
            self.assertEqual(bridge.credentials(left), (os.getpid(), os.getuid(), os.getgid()))
        finally:
            left.close()
            right.close()


if __name__ == '__main__':
    unittest.main()
