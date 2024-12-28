#!/usr/bin/env python3

import os
import sys
import subprocess

host_cc = os.environ['host_cc']
target_cc = os.environ['target_cc']

def flt_target(cmd):
    for x in cmd:
        if 'self-contained' in x and '.o' in x:
            continue
        elif 'self-contained' in x:
            yield '/nowhere'
        elif '-Wl,' in x:
            continue
        elif '-lunwind' in x:
            continue
        elif '-lgcc_s' in x:
            continue
        elif x == '-lc':
            continue
        elif x == '-static-pie':
            continue
        else:
            yield x

def flt_host(cmd):
    return cmd

fs_cc = [
    'clang-19',
    '-fuse-ld=lld',
    '-nostdlib',
    '-nostdlib++',
]

def call(args):
    print(f'call {args}', file=sys.stderr)
    return subprocess.check_call(args)

def run():
    for cc in (fs_cc, [target_cc], [host_cc]):
        try:
            return call(cc + sys.argv[1:])
        except Exception as e:
            err = e

        try:
            return call(list(flt_target(cc + sys.argv[1:])))
        except Exception as e:
            err = e

    raise err

run()
