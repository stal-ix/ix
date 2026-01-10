import os
import sys
import json
import subprocess

args = json.loads(sys.stdin.read())['cmd']

def it_bins():
    for x in P.split(';'):
        x = x.strip()

        if x:
            yield x

def need_plugins():
    if os.environ.get('IX_STEP', '') == 'configure':
        return False

    if '-o' in args:
        o = args[args.index('-o') + 1]
    else:
        o = ''

    if '/' in o:
        a = frozenset(args + [os.path.basename(o)])
    else:
        a = frozenset(args)

    for x in it_bins():
        if x in a:
            return True

def flt_plugins(args):
    for x in args:
        if x.endswith('/lib/reg.o'):
            pass
        else:
            yield x

if not need_plugins():
    print(json.dumps({
        'cmd': list(flt_plugins(args)),
    }))
