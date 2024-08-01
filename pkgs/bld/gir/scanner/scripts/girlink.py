#!/usr/bin/env python3

import os
import sys
import json
import hashlib
import subprocess

if '-c' in sys.argv:
    subprocess.check_call(sys.argv[1:])
    sys.exit(0)

if '-E' in sys.argv:
    subprocess.check_call(sys.argv[1:])
    sys.exit(0)

print(f'GIRLINK {sys.argv}', file=sys.stderr)

def call(*args, **kwargs):
    print(f'call {args}', file=sys.stdout)
    return subprocess.check_output(*args, **kwargs)

uuid = hashlib.md5(json.dumps(sys.argv).encode()).hexdigest()
temp = os.environ['tmp'] + f'/{uuid}.o'
comp = sys.argv[1]
args = sys.argv[2:]

def it_obj():
    for x in args:
        if x.endswith('.o'):
            yield x
        elif x.endswith('.a'):
            if 'obj/src/' not in x:
                yield x

def sym_list():
    cmd = [
        'llvm-nm',
        '--defined-only',
        '--extern-only',
    ] + list(it_obj())

    for l in call(cmd).decode().split('\n'):
        if ' ' in l:
            yield l.split(' ')[-1].strip()

def it_syms():
    for s in sorted(sym_list()):
        if s == 'main':
            pass
        else:
            yield f'rdynamic {s} {s}'

dprog = '\n'.join(sorted(frozenset(it_syms())))
cprog = call(['dl_stubs'], input=dprog.encode())

def flt_args(a):
    for x in a:
        if x.startswith('-l'):
            pass
        elif x.startswith('-L'):
            pass
        elif x.startswith('-Wl'):
            pass
        elif 'obj/src/' in x and '.a' in x:
            pass
        else:
            yield x

try:
    call([comp, '-o', temp, '-c', '-x', 'c', '-'], input=cprog)
    call([comp] + list(flt_args(args)) + [temp])
finally:
    os.unlink(temp)
