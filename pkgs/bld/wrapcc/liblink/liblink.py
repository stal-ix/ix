#!/usr/bin/env python3

import os
import sys
import subprocess

def mkdir(x):
    try:
        os.makedirs(x)
    except OSError:
        pass

def link_lib(x, objs):
    if '/' in x:
        mkdir(os.path.dirname(x))

    if objs:
        subprocess.check_call(['llvm-ar', 'qL', x] + objs)
    else:
        with open(x, 'w') as f:
            pass

    tmpdir = os.environ['tmp'] + '/lib'
    mkdir(tmpdir)
    f = os.path.basename(x)
    subprocess.check_call(['cp', x, tmpdir + '/' + f[:f.index('.')] + '.a'])

print(f'LIBLINK {sys.argv}', file=sys.stderr)
link_lib(sys.argv[1], sys.argv[2:])
