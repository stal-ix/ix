#!/usr/bin/env python3

import os
import sys
import shutil
import subprocess

rest = []
vm = []

def it_tokens(lst):
    for x in lst:
        if x.startswith('@'):
            with open(x[1:]) as f:
                yield from it_tokens(list(f.read().strip().split('\n')))
        else:
            yield x

for x in it_tokens(sys.argv[1:]):
    if x.startswith('-J'):
        vm.append(x[2:])
    else:
        rest.append(x)

if '-sourcepath' in rest:
    if 'IX_EXTRA_SP' in os.environ:
        idx = rest.index('-sourcepath') + 1
        rest[idx] = os.environ['IX_EXTRA_SP'] + ':' + rest[idx]

        if os.getcwd().endswith('/jaxp'):
            rest[idx] = os.environ['IX_EXTRA_SP_JAXP'] + ':' + rest[idx]

cmd = [os.environ['JAVACMD'], '-classpath', os.environ['JAVAC_JAR']] + vm + ['com.sun.tools.javac.Main'] + rest

try:
    subprocess.check_call(cmd)
except Exception as e:
    with open('repro.sh', 'w') as f:
        for k, v in os.environ.items():
            print(f'export {k}="{v}"', file=f)

        for x in cmd:
            print(x + ' \\', file=f)

    raise e
