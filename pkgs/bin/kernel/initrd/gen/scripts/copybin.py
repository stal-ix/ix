#!/usr/bin/env python3

import os
import sys
import shutil

fr = sys.argv[1]
to = sys.argv[2]

vis = set()

for x in os.listdir(fr):
    if 'kernel-' in x:
        continue

    p = os.path.join(fr, x)

    if os.path.isdir(p):
        continue

    r = os.path.normpath(os.path.realpath(p))
    br = os.path.basename(r)

    if br == x:
        if r not in vis:
            vis.add(r)
            shutil.copyfile(r, to + '/' + br)
    else:
        os.symlink(br, to + '/' + x)
