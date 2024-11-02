#!/usr/bin/env python3

import os
import sys
import subprocess

host_cc = os.environ['host_cc']
target_cc = os.environ['target_cc']

def flt_target(cmd):
    for x in cmd:
        if 'self-contained' in x and '.o' in x:
            continue
        elif 'self-contained' in x:
            yield '/nowhere'
        elif '-Wl,' in x:
            continue
        elif '-lunwind' in x:
            continue
        elif x == '-static-pie':
            continue
        else:
            yield x

def flt_host(cmd):
    return cmd

def run():
    for cc in (target_cc, host_cc):
        try:
            return subprocess.check_call([cc] + sys.argv[1:])
        except Exception as e:
            err = e

        try:
            return subprocess.check_call(list(flt_target([cc] + sys.argv[1:])))
        except Exception as e:
            err = e

    raise err

run()
