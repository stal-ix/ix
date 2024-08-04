#!/usr/bin/env python3

import os
import sys
import json
import hashlib
import subprocess

if '-c' in sys.argv:
    subprocess.check_call(sys.argv[1:])
    sys.exit(0)

if '-E' in sys.argv:
    subprocess.check_call(sys.argv[1:])
    sys.exit(0)

print(f'GIRLINK {sys.argv}', file=sys.stderr)

subprocess.check_call(['dynlink'] + sys.argv[1:])
