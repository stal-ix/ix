#!/usr/bin/env python3

import os
import sys
import shutil
import subprocess

rest = []
vm = []

for x in sys.argv[1:]:
    if x.startswith('-J'):
        vm.append(x[2:])
    else:
        rest.append(x)

os.environ['CLASSPATH'] = os.environ['CLASSPATH'] + ':' + os.environ['ECJ_JAR']

cmd = ['jamvm'] + vm + ['org.eclipse.jdt.internal.compiler.batch.Main']

if '-source' not in rest:
    cmd += ['-source', '1.5']

if '-target' not in rest:
    cmd += ['-target', '1.5']

if '-cp' not in rest:
    cmd += ['-cp', '.']

subprocess.check_call(cmd + ['-nowarn'] + rest)
