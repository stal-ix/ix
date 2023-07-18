#!/usr/bin/env python3

import os
import sys

def fix_line(l):
    return '#!/usr/bin/env ' + os.path.basename(l.strip())

def fix(data):
    if data[:2].decode() == '#!':
        p = data.index(b'\n')

        return fix_line(data[:p].decode()).encode() + data[p:]

    return data

def fix_p(p):
    with open(p, 'rb') as f:
        data = f.read()

    nd = fix(data)

    if nd == data:
        return

    print(f'fixed {p}')

    with open(p, 'wb') as f:
        f.write(nd)

for x in sys.argv[1:]:
    fix_p(x)
