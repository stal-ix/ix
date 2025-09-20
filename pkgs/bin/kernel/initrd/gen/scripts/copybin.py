#!/usr/bin/env python3

import os
import sys
import shutil

fr = sys.argv[1]
to = sys.argv[2]

for x in os.listdir(fr):
    p = os.path.join(fr, x)

    if os.path.isdir(p):
        continue

    r = os.path.normpath(os.path.realpath(p))

    print(r)
