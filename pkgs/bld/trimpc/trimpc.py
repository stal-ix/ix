#!/usr/bin/env python3

import sys

def join(a, b):
    a = a.strip()
    b = b.strip()

    if not a:
        return b

    if not b:
        return a

    if ',' in a or ',' in b:
        return a + ', ' + b

    return a + ' ' + b

def fix(data):
    keys = {}

    for l in data.split('\n'):
        if ': ' in l:
            a, b = l.split(': ')
            keys[a] = b
        else:
            yield l

    for k in ('Requires', 'Libs'):
        if f'{k}.private' in keys:
            keys[k] = join(keys.get(k, ''), keys.pop(f'{k}.private'))

    for k, v in keys.items():
        yield f'{k}: {v}'


for x in sys.argv[1:]:
    with open(x) as f:
        odata = f.read()

    print(odata)

    ndata = '\n'.join(fix(odata)).strip() + '\n'

    if odata == ndata:
        print(f'skip {x}')
    else:
        print(f'fix {x}')

        with open(x, 'w') as f:
            f.write(ndata)
