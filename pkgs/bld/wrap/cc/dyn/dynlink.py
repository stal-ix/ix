#!/usr/bin/env python3

import os
import sys
import json
import shutil
import hashlib
import subprocess

if os.environ.get('IX_VERBOSE'):
    print(f'DYNLINK {sys.argv}', file=sys.stderr)

uuid = hashlib.md5(json.dumps(sys.argv).encode()).hexdigest()
temp = os.environ['tmp'] + f'/{uuid}.o'

def flt_args(args):
    for x in args:
        if x in ('-rdynamic', '-export-dynamic'):
            pass
        else:
            yield x

args = list(flt_args(sys.argv[1:]))

def it_obj():
    for x in args:
        if x.endswith('.o'):
            yield x
        elif x.endswith('.a'):
            yield x

def sym_list():
    cmd = [
        'llvm-nm',
        '--defined-only',
        '--extern-only',
    ] + list(it_obj())

    for l in subprocess.check_output(cmd).decode().split('\n'):
        if ' ' in l:
            yield l.split(' ')[-1].strip()

def it_syms():
    for s in sorted(sym_list()):
        if s.startswith('_'):
            pass
        elif s == 'main':
            pass
        else:
            yield f'rdynamic {s} {s}'

dprog = '\n'.join(sorted(frozenset(it_syms())))
cprog = subprocess.check_output(['dl_stubs'], input=dprog.encode())

try:
    subprocess.check_output([os.environ['SELF'].replace('/c++', '/cc'), '-fno-builtin', '-o', temp, '-c', '-x', 'c', '-'], input=cprog)
    subprocess.check_output(['exelink'] + args + [temp])
finally:
    os.unlink(temp)
