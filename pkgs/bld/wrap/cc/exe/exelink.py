#!/usr/bin/env python3

import os
import sys
import json
import subprocess

# for bld/ruby
if 'conftest' not in str(sys.argv):
    if os.environ.get('IX_VERBOSE'):
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

subprocess.check_call(flt_args(sys.argv[1:] + ['-L' + os.environ['tmp'] + '/lib']))
