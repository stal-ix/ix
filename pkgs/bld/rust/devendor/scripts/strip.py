#!/usr/bin/env python3

import sys

n = 0

for l in sys.stdin.read().split('\n'):
    if l.startswith('[profile'):
        print(f'[__xxx{n}]')
        n +=1
    else:
        print(l)
