#!/usr/bin/env python3

import os
import sys
import json
import hashlib
import subprocess

verbose = os.environ.get('IX_VERBOSE')

def res_path(where, f):
    for x in where:
        p = os.path.join(x, f)

        if os.path.isfile(p):
            return p

    raise Exception(f'no {f} in {where}')

def is_src(x):
    if x.endswith('.c'):
        return True
    elif x.endswith('.cpp'):
        return True
    elif x.endswith('.S'):
        return True

def flt_srcs(cmd):
    for x in cmd:
        if is_src(x):
            pass
        else:
            yield x

def compile_src(s, cmd):
    cmd = list(flt_srcs(cmd))
    uid = hashlib.md5(json.dumps(cmd + [os.path.abspath(s)]).encode()).hexdigest()
    tmp = os.environ['tmp'] + f'/norm_{uid}.o'
    cmd = cmd + ['-c', s, '-o', tmp]

    if verbose:
        print(f'COMPILE {cmd}', file=sys.stderr)

    subprocess.check_output(cmd)

    return tmp

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
        elif is_src(x):
            yield compile_src(x, o)
        else:
            yield x

print(json.dumps({
    'cmd': list(norm(json.loads(sys.stdin.read())['cmd'])),
}))
