#!/usr/bin/env python3

import os
import sys
import json
import hashlib
import subprocess

print(f'EXELINK {sys.argv}', file=sys.stderr)

uuid = hashlib.md5(json.dumps(sys.argv).encode()).hexdigest()
temp = os.environ['tmp'] + f'/{uuid}.o'
comp = sys.argv[1]
args = sys.argv[2:]

def it_linkable():
    for x in args:
        if x.startswith('/'):
            continue

        if x.endswith('.o'):
            yield x
        elif x.endswith('.a'):
            yield x
        elif x.endswith('.so'):
            yield x
        elif x.endswith('.dylib'):
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

def main():
    try:
        cprog = '\n'.join(it_parts()).strip() + '\n'
    except Exception as e:
        return subprocess.check_call(sys.argv[1:])

    print(cprog, file=sys.stderr)

    try:
        subprocess.check_output(['clang', '-o', temp, '-c', '-x', 'c', '-'], input=cprog.encode())
        subprocess.check_output([comp] + args + [temp])
    finally:
        os.unlink(temp)

main()
