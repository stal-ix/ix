#!/usr/bin/env python3

import os
import sys
import json
import hashlib
import subprocess

uuid = hashlib.md5(json.dumps(sys.argv).encode()).hexdigest()
temp = os.environ['tmp'] + f'/{uuid}.o'
comp = sys.argv[1]
args = sys.argv[2:]

print(f'DYNLINK {sys.argv}', file=sys.stderr)

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
        if s != 'main':
            yield f'rdynamic {s} {s}'

dprog = '\n'.join(it_syms())
cprog = subprocess.check_output(['dl_stubs'], input=dprog.encode())
subprocess.check_output(['clang', '-o', temp, '-c', '-x', 'c', '-'], input=cprog)
subprocess.check_output([comp] + args + [temp])
