#!/usr/bin/env python3

import os
import sys
import json
import shutil
import hashlib
import subprocess

def flt_args(args):
    for x in args:
        if '-rdynamic' in x:
            pass
        elif '-export-dynamic' in x:
            pass
        else:
            yield x

args = list(flt_args(json.loads(sys.stdin.read())['cmd']))

if os.environ.get('IX_VERBOSE'):
    print(f'DYNLINK {args}', file=sys.stderr)

uuid = hashlib.md5(json.dumps(args).encode()).hexdigest()
temp = os.environ['tmp'] + f'/dynlink_{uuid}.o'

def it_obj():
    for x in args:
        if x.endswith('.o'):
            yield x
        elif x.endswith('.a'):
            yield x

def sym_list():
    if lst := list(it_obj()):
        cmd = [
            'llvm-nm',
            '--defined-only',
            '--extern-only',
        ] + lst

        for l in subprocess.check_output(cmd).decode().split('\n'):
            if ' ' in l:
                yield l.split(' ')[-1].strip()

def it_syms():
    for s in sorted(sym_list()):
        if s.startswith('_'):
            pass
        elif '.' in s:
            pass
        elif s == 'main':
            pass
        else:
            yield f'rdynamic {s} {s}'

dprog = '\n'.join(sorted(frozenset(it_syms())))
cprog = subprocess.check_output(['dl_stubs'], input=dprog.encode())

subprocess.check_output([os.environ['SELF'].replace('/c++', '/cc'), '-fno-builtin', '-o', temp, '-c', '-x', 'c', '-'], input=cprog)

sys.stdout.write(json.dumps({
    'cmd': args + [temp],
}))
