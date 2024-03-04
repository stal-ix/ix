#!/usr/bin/env python3

import os
import sys
import subprocess

print(f'EXELINK {sys.argv}', file=sys.stderr)
subprocess.check_call(sys.argv[1:] + ['-L' + os.environ['tmp'] + '/lib'])
