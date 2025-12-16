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

def it_plugins():
    if x := os.environ.get('PLUGIN'):
        yield x

    if x := os.environ.get('PLUGINS'):
        for y in x.split(':'):
            y = y.strip()

            if y:
                yield y

if need_plugins():
    print(json.dumps({
        'cmd': args + list(it_plugins()),
    }))
