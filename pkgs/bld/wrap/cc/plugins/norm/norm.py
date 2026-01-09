#!/usr/bin/env python3

import os
import sys
import json

verbose = os.environ.get('IX_VERBOSE')

def res_path(where, f):
    for x in where:
        p = os.path.join(x, f)

        if os.path.isfile(p):
            return p

    raise Exception(f'no {f} in {where}')

def norm(cmd):
    l = []
    o = []

    for x in cmd:
        if x.startswith('-L'):
            l.append(os.path.abspath(x[2:]))
        else:
            o.append(x)

    for x in o:
        if x.startswith('-l'):
            yield res_path(l, 'lib' + x[2:] + '.a')
        elif x.endswith('.o'):
            yield os.path.abspath(x)
        elif x.endswith('.a'):
            yield os.path.abspath(x)
        elif x.endswith('.c'):
            yield os.path.abspath(x)
        elif x.endswith('.cpp'):
            yield os.path.abspath(x)
        elif x.endswith('.S'):
            yield os.path.abspath(x)
        else:
            yield x

print(json.dumps({
    'cmd': list(norm(json.loads(sys.stdin.read())['cmd'])),
}))
