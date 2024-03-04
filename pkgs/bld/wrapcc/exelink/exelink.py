#!/usr/bin/env python3

import sys
import subprocess

print(f'EXELINK {sys.argv}', file=sys.stderr)
subprocess.check_call(sys.argv[1:])
