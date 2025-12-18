#!/usr/bin/env python3

import os
import sys
import subprocess

if os.environ.get('IX_VERBOSE'):
    print(f'LIBLINK {sys.argv}', file=sys.stderr)

def mkdir(x):
    try:
        os.makedirs(x)
    except OSError:
        pass

def flt(lst):
    for x in lst:
        if x.startswith('/lib'):
            pass
        elif x.endswith('/lib/reg.o'):
            pass
        else:
            yield x

def link_lib(x, objs):
    if '/' in x:
        mkdir(os.path.dirname(x))

    if objs:
        subprocess.check_call(['llvm-ar', 'qL', x] + objs)
    else:
        with open(x, 'w') as f:
            pass

    f = os.path.basename(x)

    if '.so' in f or '.dylib' in f:
        tmpdir = os.environ['tmp'] + '/lib'
        mkdir(tmpdir)
        subprocess.check_call(['cp', x, tmpdir + '/' + f[:f.index('.')] + '.a'])

link_lib(sys.argv[1], list(flt(sys.argv[2:])))
