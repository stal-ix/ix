import os
import sys


where = sys.argv[1]
names = sys.argv[2:]


def find_file(n, where):
    for a, b, c in os.walk(where):
        for x in c:
            if x == n:
                return os.path.join(where, a, x)

    raise Exception(f'can not find {n} in {where}')


for l in open(find_file('config.c', where)).read().splitlines():
    if 'ADDMODULE MARKER 1' in l:
        for x in names:
            print(f'extern PyObject* PyInit_{x}();')
    elif 'ADDMODULE MARKER 2' in l:
        for x in names:
            print('{' + f'"{x}", PyInit_{x}' + '},')
    else:
        print(l)
