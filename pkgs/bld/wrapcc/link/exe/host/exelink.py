#!/usr/bin/env python3

import os
import sys
import shutil
import subprocess

# for bld/ruby
if 'conftest' not in str(sys.argv):
    print(f'EXELINK {sys.argv}', file=sys.stderr)

try:
    subprocess.check_call(sys.argv[1:] + ['-L' + os.environ['tmp'] + '/lib'])
except Exception as e:
    out = sys.argv[sys.argv.index('-o') + 1]
    res = shutil.which(os.path.basename(out))

    if not res:
        res = shutil.which(os.path.basename(out).replace('_', '-'))

    if not res:
        raise e

    shutil.copy(res, out)
