#!/usr/bin/env python3

import os
import sys
import hashlib
import subprocess

def it_args():
    for x in sys.argv[1:]:
        if x:
            if x[0] == '@':
                yield from open(x[1:]).read().split()
            else:
                yield x

def key(x):
    if x.endswith('.o'):
        return hashlib.md5(open(x, 'rb').read()).hexdigest()

    return x

def uniq(lst):
    v = set()

    for x in lst:
        k = key(x)

        if k in v:
            print(f'SKIP duplicate entry {x}', file=sys.stderr)
            continue

        v.add(k)

        yield x

args = list(uniq(it_args()))
print(args, file=sys.stderr)
subprocess.check_call(args)
