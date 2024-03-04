#!/usr/bin/env python3

import sys
import suprocess

print(f'EXELINK {sys.argv}', file=sys.stderr)
subprocess.check_call(sys.argv[1:])
