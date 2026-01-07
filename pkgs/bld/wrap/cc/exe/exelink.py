#!/usr/bin/env python3

import os
import sys
import json
import subprocess

verbose = os.environ.get('IX_VERBOSE')

if os.environ.get('IX_STEP', '') == 'configure':
    pass
elif verbose:
    print(f'EXELINK {sys.argv}', file=sys.stderr)

def it_plugins(cmd):
    for x in cmd:
        if x.startswith('-L/PLUGIN:'):
            yield x[10:]

def flt_args(cmd):
    req = {
        'cmd': cmd,
    }

    for p in sorted(frozenset(it_plugins(cmd))):
        if data := subprocess.check_output([p], input=json.dumps(req).encode()).decode():
            if res := json.loads(data):
                req.update(res)

    return req['cmd']

cmd = flt_args(sys.argv[1:] + ['-L' + os.environ['tmp'] + '/lib'])

for x in ('-rdynamic', '-export-dynamic'):
    if x in str(cmd):
        raise Exception('please add wrap_rdynamic into build_flags')

if verbose:
    subprocess.check_call(cmd)
else:
    os.execvp(cmd[0], cmd)
