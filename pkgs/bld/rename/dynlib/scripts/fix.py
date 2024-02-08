#!/usr/bin/env python3

import os
import sys

from collections import defaultdict

by_rp = defaultdict(list)

for x in os.listdir(sys.argv[1]):
    if '.so' in x or '.dylib' in x:
        p = os.path.join(sys.argv[1], x)
        by_rp[os.path.realpath(p)].append(p)

for p, links in by_rp.items():
    print(p, links)

    ml = list(sorted(links, key=lambda x: len(x)))[0]

    print(ml)

    if '.so' in ml:
        ml = ml[:ml.index('.so')] + '.a'
    else:
        ml = ml[:ml.index('.dylib')] + '.a'

    print(p, ml)

    os.link(p, ml)
