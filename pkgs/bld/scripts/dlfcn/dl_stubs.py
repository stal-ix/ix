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

print('#include <dlfcn.h>')

for l, a, b in S:
    print(f'extern "C" void* {b};')

for l, a, b in S:
    print(f'DL_LIB("{l}")')
    print(f'DL_S_2("{a}", &{b})')
    print('DL_END()')
