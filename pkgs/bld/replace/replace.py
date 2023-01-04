#!/usr/bin/env python3

import sys

p = sys.argv[1]
f = sys.argv[2]
t = sys.argv[3]

def fix(data):
    for l in data.split('\n'):
        if p in l:
            yield l.replace(f, t)
        else:
            yield l

for path in sys.argv[4:]:
    with open(path) as ff:
        odata = ff.read()

    ndata = '\n'.join(fix(odata)).strip() + '\n'

    if odata != ndata:
        with open(path, 'w') as ff:
            ff.write(ndata)
