import sys

lib = sys.argv[1]

def it_symbols():
    for l in sys.stdin.read().splitlines():
        l = l.strip()

        if not l:
            continue

        yield tuple(l.split(' '))

S = list(it_symbols())

print('#include <dlfcn.h>')

for a, b in S:
    print(f'extern "C" void* {b};')

print(f'DL_LIB("{lib}")')

for a, b in S:
    print(f'DL_S_2("{a}", &{b})')

print('DL_END()')
