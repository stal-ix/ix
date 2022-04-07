#!/usr/bin/env python3

import os
import sys

l = sys.argv[1]

for p in os.environ['MIX_T_DIR'].split(':'):
    pp = os.path.join(p, 'lib', l)

    if os.path.isfile(pp):
        print(pp)
        sys.exit(0)

print(f'can not find {l}')
sys.exit(1)
