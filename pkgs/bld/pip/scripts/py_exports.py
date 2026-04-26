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
            # Skip files with internal dots (e.g. CPython 3.10's
            # `__phello__.foo.py`, a frozen-module source file). The
            # filename's dot is part of the module name baked into the
            # frozen importer, not a package boundary — listing it as
            # `__phello__.foo` makes freeze.py's modulefinder look for
            # a package `__phello__` that doesn't exist (no
            # __phello__/__init__.py) and bail with ImportError.
            if '.' in x[:-3]:
                continue

            print(os.path.join(a, x)[len(d) + 1:-3].replace('/', '.'))
