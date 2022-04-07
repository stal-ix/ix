#!/usr/bin/env python3

import sys

def it_symbols():
    for l in sys.stdin.read().splitlines():
        l = l.strip()

        if not l:
            continue

        if l[0] == '#':
            continue

        while '  ' in l:
            l = l.replace('  ', ' ')

        yield tuple(l.split(' '))

S = list(it_symbols())

assert S

print('#include <dlfcn.h>')

for l, a, b in S:
    print(f'extern void* {b};')

print('__attribute__((constructor)) static void init_dl() {')

for l, a, b in S:
    print(f'stub_dlregister("{l}", "{a}", &{b});')

print('}')
