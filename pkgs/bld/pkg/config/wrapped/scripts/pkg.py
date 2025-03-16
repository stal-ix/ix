#!/usr/bin/env python3

import sys
import shutil
import subprocess

prefix = '--variable='

for x in sys.argv:
    if x.startswith(prefix):
        if w := shutil.which(x[len(prefix):].replace('_', '-')):
            print(w)
            sys.exit(0)

subprocess.check_call(['pkg-config-bin'] + sys.argv[1:])
