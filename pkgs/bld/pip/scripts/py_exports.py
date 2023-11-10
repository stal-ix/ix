#!/usr/bin/env python3

import os
import sys

d = os.getcwd()

for a, b, c in os.walk(d):
    print(f'try {a}', file=sys.stderr)

    if not os.path.isfile(os.path.join(a, '__init__.py')):
        print(f'not a module: {a}', file=sys.stderr)

        continue

    for x in c:
        if x.endswith('.py'):
            print(os.path.join(a, x)[len(d) + 1:-3].replace('/', '.'))
