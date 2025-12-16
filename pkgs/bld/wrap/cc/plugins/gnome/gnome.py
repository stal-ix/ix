#!/usr/bin/env python3

import os
import sys
import json
import hashlib
import subprocess

args = json.loads(sys.stdin.read())['cmd']
uuid = hashlib.md5(json.dumps(args).encode()).hexdigest()
temp = os.environ['tmp'] + f'/{uuid}.o'

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

def it_funcs():
    data = subprocess.check_output(['llvm-nm', '-j', '-g'] + list(it_linkable()))
    yield from data.decode().split('\n')
    yield 'g_signal_group_get_type'

def it_init():
    yield 'void gobject_init(void)', 'gobject_init()'

    for l in sorted(frozenset(it_funcs())):
        l = l.strip()

        if 'ephy_web_extension_get_resource' in l:
            continue

        if 'cairo_surface_' in l:
            continue

        if 'g_static_resource_' in l:
            continue

        if 'ddjvu_document_' in l:
            continue

        if 'g_variant_get_type' in l:
            continue

        if l.endswith('_get_type'):
            yield f'void* {l}(void)', f'{l}()'
        elif l.endswith('_get_resource'):
            yield f'void* {l}(void)', f'{l}()'

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

sys.stdout.write(json.dumps({
    'cmd': args + [temp],
}))
