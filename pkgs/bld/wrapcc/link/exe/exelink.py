#!/usr/bin/env python3

import os
import sys
import subprocess

# for bld/ruby
if 'conftest' not in str(sys.argv):
    print(f'EXELINK {sys.argv}', file=sys.stderr)

subprocess.check_call(sys.argv[1:] + ['-L' + os.environ['tmp'] + '/lib'])
