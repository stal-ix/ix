#!/usr/bin/env python3

import os
import sys
import collections

def files(d):
    for a, b, c in os.walk(d):
        for x in c:
            yield os.path.join(a, x)

for d in os.listdir(sys.argv[1]):
    dd = os.path.join(sys.argv[1], d)

    if not os.path.isdir(dd):
        continue

    ff = list(files(dd))
    be = collections.defaultdict(list)

    for f in ff:
        n = os.path.basename(f)
        ext = n[n.rfind('.') + 1:]
        be[ext].append(f)

    bad = 0

    for ext in ['c', 'h', 'cpp', 'cxx']:
        if ext in be:
            bad += len(be[ext])

    if bad > 5:
        print(d)
