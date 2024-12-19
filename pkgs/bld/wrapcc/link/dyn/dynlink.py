#!/usr/bin/env python3

import os
import sys
import json
import hashlib
import subprocess

uuid = hashlib.md5(json.dumps(sys.argv).encode()).hexdigest()
temp = os.environ['tmp'] + f'/{uuid}.o'
comp = sys.argv[1]

def fix_xlinker(args):
    while True:
        try:
            p = args.index('-Xlinker')
            args = args[:p] + ['-Wl,' + args[p + 1]] + args[p + 2:]
        except ValueError:
            return args

def flt_args(args):
    for x in args:
        if x in ('-rdynamic', '-export-dynamic'):
            pass
        else:
            yield x

args = list(flt_args(fix_xlinker(sys.argv[2:])))

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
        if s.startswith('_'):
            pass
        elif s == 'main':
            pass
        else:
            yield f'rdynamic {s} {s}'

dprog = '\n'.join(sorted(frozenset(it_syms())))
cprog = subprocess.check_output(['dl_stubs'], input=dprog.encode())

if comp.endswith('++'):
    xcomp = comp[:-2]
else:
    xcomp = comp

try:
    subprocess.check_output([xcomp, '-o', temp, '-c', '-x', 'c', '-'], input=cprog)
    subprocess.check_output(['exelink', comp] + args + [temp])
finally:
    os.unlink(temp)
