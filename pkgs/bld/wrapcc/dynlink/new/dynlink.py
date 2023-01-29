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

def it_linkable():
    for x in args:
        if x.endswith('.o'):
            yield x
        elif x.endswith('.a'):
            yield x

def it_init():
    data = subprocess.check_output(['llvm-nm', '-j', '-g'] + list(it_linkable()))

    yield 'void gobject_init(void)', 'gobject_init()'

    for l in sorted(frozenset(data.decode().split('\n'))):
        l = l.strip()

        if 'ephy_web_extension_get_resource' in l:
            continue

        if l.endswith('_get_type'):
            yield f'void* {l}(void)', f'{l}()'
        elif l.endswith('_get_resource'):
            yield f'void* {l}(void)', f'{l}()'

sa = str(sys.argv)

def it_parts():
    prot = []
    call = []

    for p, c in it_init():
        prot.append(p)
        call.append(c)

    yield '\n'.join([x + ';' for x in prot])
    yield '__attribute__((constructor)) void call_gtk_shim() {'
    yield '\n'.join([x + ';' for x in call])
    yield '}'

cprog = '\n'.join(it_parts()).strip() + '\n'

print(cprog, file=sys.stderr)

subprocess.check_output(['clang', '-o', temp, '-c', '-x', 'c', '-'], input=cprog.encode())
subprocess.check_output([comp] + args + [temp])
