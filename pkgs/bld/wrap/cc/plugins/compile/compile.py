#!/usr/bin/env python3

import os
import sys
import json
import hashlib
import subprocess

verbose = os.environ.get('IX_VERBOSE')

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

def main(cmd):
    for x in cmd:
        if is_src(x):
            yield compile_src(x, cmd)
        elif x.startswith('-D'):
            pass
        elif x.startswith('-I'):
            pass
        elif x.startswith('-isystem'):
            pass
        else:
            yield x

print(json.dumps({
    'cmd': list(main(json.loads(sys.stdin.read())['cmd'])),
}))
