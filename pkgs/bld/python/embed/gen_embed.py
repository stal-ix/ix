#!/usr/bin/env python3

import sys
import json
import base64

res = dict()

for l in sys.stdin.read().split('\n'):
    l = l.strip()

    if not l:
        continue

    with open(l, 'rb') as f:
        data = f.read()

    res[l] = base64.b64encode(data).decode()

PROG = '''
import json
import base64

DATA = json.loads('{data}')

def find(key):
    return base64.b64decode(DATA[key].encode())
'''

print(PROG.replace('{data}', json.dumps(res)))
