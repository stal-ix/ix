#!/usr/bin/env python3

import os
import sys
import subprocess

if os.environ.get('IX_VERBOSE'):
    print(f'LIBLINK {sys.argv}', file=sys.stderr)

def flt_objs(argv):
    for x in argv:
        if x.endswith('.o'):
            yield x
        elif x.endswith('.os'):
            yield x
        elif x.startswith('-Wl,'):
            pass
        elif '/store/' in x:
            pass
        elif x.endswith('.a'):
            yield x

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

args = sys.argv[1:]

link_lib(args[args.index('-o') + 1], list(flt(flt_objs(args))))
