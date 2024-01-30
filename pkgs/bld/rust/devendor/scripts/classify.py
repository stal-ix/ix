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

    bad_h = 0
    bad_c = 0

    for ext in ['h', 'hpp', 'hxx', 'hh']:
        if ext in be:
            bad_h += len(be[ext])

    for ext in ['c', 'cpp', 'cxx', 'cc']:
        if ext in be:
            bad_c += len(be[ext])

    if bad_c > 0 and (bad_h + bad_c) > 5:
        print(d)
