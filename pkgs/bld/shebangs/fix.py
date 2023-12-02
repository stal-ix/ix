#!/usr/bin/env python3

import os
import sys

def fix_line(l):
    r = '#!/usr/bin/env ' + os.path.basename(l.strip())

    print(f'replace {l} -> {r}')

    return r

def fix(data):
    if data[:2].decode() == '#!':
        p = data.index(b'\n')
        pd = data[:p].decode()

        if '/usr/bin/env' not in pd:
            return fix_line(pd).encode() + data[p:]

    return data

def fix_p(p):
    with open(p, 'rb') as f:
        sample = f.read(1)

        if len(sample) > 0 and chr(sample[0]) != '#':
            print(f'not a script - {p}')
            return

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
