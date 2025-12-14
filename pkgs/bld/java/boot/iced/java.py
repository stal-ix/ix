#!/usr/bin/env python3

import os
import sys
import json
import shutil
import subprocess

vm = []
cl = []

for x in sys.argv[1:]:
    if x.startswith('-J'):
        vm.append(x[2:])
    else:
        cl.append(x)

hs = shutil.which('hotspot')

env = os.environ.copy()
env['JAVA_HOME'] = os.path.dirname(os.path.dirname(hs))
cmd = [hs] + vm + cl

try:
    subprocess.check_call(cmd, env=env)
except Exception as e:
    print(f'{cmd} -> {e}', file=sys.stderr)

    raise e
