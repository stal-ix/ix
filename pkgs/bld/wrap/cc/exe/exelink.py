#!/usr/bin/env python3

import os
import sys
import json
import subprocess

verbose = os.environ.get('IX_VERBOSE')

if os.environ.get('IX_STEP', '') == 'configure':
    pass
elif verbose:
    print(f'LINK {sys.argv}', file=sys.stderr)

def is_link_lib(raw_args):
    if 'chrome' in raw_args:
        return False

    if '-shared' in raw_args:
        return True

    if '--shared' in raw_args:
        return True

    if '-bundle' in raw_args:
        return True

    if '--soname' in str(raw_args):
        return True

    if '-Wl,-soname' in str(raw_args):
        return True

    if '-o' in raw_args:
        out = raw_args[raw_args.index('-o') + 1]

        if out.endswith('.so'):
            return True

        if out.endswith('.dylib'):
            return True

    return False

def it_plugins(cmd):
    for x in cmd:
        if x.startswith('-L/PLUGIN:'):
            yield x[10:]

def flt_args(cmd):
    req = {
        'cmd': cmd,
    }

    for p in sorted(frozenset(it_plugins(cmd)), key=os.path.basename):
        if data := subprocess.check_output([p], input=json.dumps(req).encode()):
            req.update(json.loads(data.decode()))

            if verbose:
                print(f'after {p}:\n' + json.dumps(req, indent=4), file=sys.stderr)

    return req['cmd']

cmd = flt_args(sys.argv[1:] + ['-L' + os.environ['tmp'] + '/lib'])

if is_link_lib(cmd):
    os.execvp('liblink', ['liblink'] + cmd)

for x in ('-rdynamic', '-export-dynamic'):
    if x in str(cmd):
        raise Exception('please add wrap_rdynamic into build_flags')

if verbose:
    print(f'EXELINK {cmd}', file=sys.stderr)

os.execvp(cmd[0], cmd)
