import sys


lib = sys.argv[1]
tgt = sys.argv[2]


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

            if '[' in l:
                continue

            try:
                _, typ, l = l.split(' ')
            except ValueError:
                continue

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

        if l == '_fini':
            continue

        if l == '_init':
            continue

        if l == '_start':
            continue

        if l == 'dladdr':
            continue

        if l == 'main':
            continue

        if tgt == 'darwin':
            l = l[1:]

        yield l


S = list(it_symbols())

print('#include <dlfcn.h>')

for s in S:
    print(f'extern "C" void* {s};')

print(f'DL_LIB("{lib}")')

for s in S:
    print(f'DL_S_2("{s}", &{s})')

print('DL_END()')
