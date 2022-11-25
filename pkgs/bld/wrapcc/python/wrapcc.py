#!/usr/bin/env python3

import os
import sys
import time
import random
import subprocess

def it_args():
    for x in sys.argv[1:]:
        if x:
            if x[0] == '@':
                yield from open(x[1:], 'r').read().split()
            elif x.startswith('-o/'):
                yield '-o'
                yield x[2:]
            else:
                yield x

def flt_args():
    for x in it_args():
        if '-D-pthread' in x:
            continue

        yield x

args = list(flt_args())

if '-r' in args:
    args = ['ld.lld'] + args[1:]

def flt_objs():
    for x in args:
        if x.endswith('.o'):
            yield x
        elif '/store/' in x:
            pass
        elif x.endswith('.a'):
            yield x

def link1(x, objs):
    if '/' in x:
        try:
            os.makedirs(os.path.dirname(x))
        except OSError:
            pass

    if objs:
        subprocess.check_call(['llvm-ar', 'qL', x] + objs)
    else:
        open(x, 'w')

def link(objs):
    for x in args:
        if '-Wl' in x:
            continue

        if '.so' in x:
            link1(x, objs)

def retry(args):
    return subprocess.check_call(args)

    tout = 1

    while True:
        try:
            return subprocess.check_call(args)
        except Exception as e:
            if 'SIGKILL' in str(e):
                tout = min(tout * 1.5, 120)
                slep = (random.random() + 0.5) * tout

                print(f'retry {args} in {slep}')

                time.sleep(slep)
            else:
                raise e

def main():
    if '-c' in args:
        pass
    elif '-shared' in str(args) or '--soname' in str(args):
        return link(list(flt_objs()))

    if '-P' in args or '-E' in args:
        arg0 = 'clang-cpp'
    else:
        arg0 = args[0]

    retry([arg0] + args[1:])

main()
