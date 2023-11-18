#!/usr/bin/env python3

import sys

try:
    prefix = sys.argv[1]
except Exception:
    prefix = ''

for l in sys.stdin.read().split('\n'):
    if l.startswith(prefix):
        l = l[len(prefix):]
    print(l)
