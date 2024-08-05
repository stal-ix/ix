#!/usr/bin/env python3

import sys
import subprocess

if '--variable=glib_mkenums' in sys.argv:
    print('glib-mkenums')
    sys.exit(0)

if '--variable=glib_genmarshal' in sys.argv:
    print('glib-genmarshal')
    sys.exit(0)

if '--variable=gdbus_codegen' in sys.argv:
    print('gdbus-codegen')
    sys.exit(0)

if '--variable=glib_compile_schemas' in sys.argv:
    print('glib-compile-schemas')
    sys.exit(0)

subprocess.check_call(['pkg-config-bin'] + sys.argv[1:])
