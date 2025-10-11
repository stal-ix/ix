#!/usr/bin/env python3

import os
import sys
import subprocess

# for bld/ruby
if 'conftest' not in str(sys.argv):
    print(f'EXELINK {sys.argv}', file=sys.stderr)

# fix for python3.14
def flt_args(cmd):
    s = set()

    for x in cmd:
        if x.endswith('.o') and x in s:
            pass
        else:
            s.add(x)

            yield x

subprocess.check_call(list(flt_args(sys.argv[1:] + ['-L' + os.environ['tmp'] + '/lib'])))
