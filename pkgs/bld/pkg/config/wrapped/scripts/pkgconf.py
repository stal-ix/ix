#!/usr/bin/env python3

import sys
import shutil
import subprocess

var = [
    'glib-mkenums',
    'glib-genmarshal',
    'gdbus-codegen',
    'glib-compile-schemas',
    'g-ir-scanner',
    'g-ir-compiler',
    'glib-compile-resources',
    'gio-querymodules',
]

for v in var:
    s = '--variable=' + v.replace('-', '_')

    if s in sys.argv:
        if w := shutil.which(v):
            print(w)
            sys.exit(0)

subprocess.check_call(['pkg-config-bin'] + sys.argv[1:])
