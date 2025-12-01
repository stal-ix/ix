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

cmd = [os.environ['JAVACMD'], '-classpath', os.environ['JAVAC_JAR']] + vm + ['com.sun.tools.javac.Main'] + rest

try:
    subprocess.check_call(cmd)
except Exception as e:
    with open('qqq', 'w') as f:
        print(' '.join(cmd), file=f)

    raise e
