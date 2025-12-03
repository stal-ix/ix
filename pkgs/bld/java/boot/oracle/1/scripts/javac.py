#!/usr/bin/env python3

import os
import sys
import shutil
import subprocess

rest = []
vm = []

for x in sys.argv[1:]:
    if x.startswith('-J'):
        v = x[2:]

        if v.startswith('-Xboot'):
            pass
        else:
            vm.append(v)
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
            if x[0] == '@':
                op = x[1:]
                np = os.path.basename(op)

                with open(op, 'r') as ff:
                    data = ff.read()

                with open(np, 'w') as ff:
                    ff.write(data)

                x = '@./' + np

            print(x + ' \\', file=f)

    raise e
