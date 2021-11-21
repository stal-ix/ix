import sys


def it_symbols():
    for l in sys.stdin.read().splitlines():
        l = l.strip()

        if not l:
            continue

        if ':' in l:
            continue

        if ' ' in l:
            if ' U ' in l:
                continue

            _, typ, l = l.split(' ')

            if typ.lower() == typ:
                continue

        if '@' in l:
            continue

        if '.' in l:
            continue

        if 'stub_dl' in l:
            continue

        if 'GCC_' in l:
            continue

        if l.startswith('__'):
            continue

        if l == 'dladdr':
            continue

        if l == 'main':
            continue

        yield l


S = list(it_symbols())

print('#include <dlfcn.h>')

for s in S:
    print(f'extern "C" void* {s};')

print(f'DL_LIB("{sys.argv[1]}")')

for s in S:
    print(f'DL_S_2("{s}", &{s})')

print('DL_END()')
