#!/usr/bin/env python3

import os
import sys
import shutil
import subprocess

rest = []
vm = []

for x in sys.argv[1:]:
    if x == '-implicit:none':
        pass
    elif x.startswith('-W'):
        pass
    elif x.startswith('-J'):
        vm.append(x[2:])
    elif x.startswith('-Xboot'):
        for cp in x.split(':')[1:]:
            rest.append('-cp')
            rest.append(cp)
    else:
        rest.append(x)

cmd = [os.environ['JAVACMD'], '-classpath', os.environ['IX_ECJ_JAR']] + vm + ['org.eclipse.jdt.internal.compiler.batch.Main']

if '-source' not in rest:
    cmd += ['-source', '1.5']

if '-target' not in rest:
    cmd += ['-target', '1.5']

if '-cp' not in rest:
    if '-classpath' not in rest:
        cmd += ['-cp', os.environ.get('CLASSPATH', '.')]

subprocess.check_call(cmd + ['-nowarn'] + rest)
