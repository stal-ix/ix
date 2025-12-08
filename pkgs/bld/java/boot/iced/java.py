#!/usr/bin/env python3

import os
import sys
import json
import subprocess

def java_home():
    if 'JAVA_HOME' in os.environ:
        return os.environ['JAVA_HOME']

    return os.path.dirname(os.path.dirname(os.path.abspath(sys.argv[0])))

vm = []
cl = []

for x in sys.argv[1:]:
    if x.startswith('-J'):
        vm.append(x[2:])
    else:
        cl.append(x)

env = os.environ.copy()
env['JAVA_HOME'] = java_home()
cmd = ['hotspot'] + vm + cl

try:
    subprocess.check_call(cmd, env=env)
except Exception as e:
    print(f'{cmd} -> {e}', file=sys.stderr)

    raise e
