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
    for x in it_bins():
        if x in args:
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
