#!/usr/bin/env python3

import sys
import json

by_fs_name = {}

for l in open('dump.json').read().split('\n'):
    l = l.strip()

    if not l:
        continue

    rec = json.loads(l)

    by_fs_name[rec['ix_pkg_fs_name']] = rec

for l in sys.stdin.read().split('\n'):
    l = l.strip()

    if not l:
        continue

    binary, fs_name = l.split(' ')

    fs_name = fs_name.split('/')[0]

    if fs_name in by_fs_name:
        print(json.dumps({
            'bin': binary,
            'ix_pkg_name': by_fs_name[fs_name]['ix_pkg_name'],
        }))
