#!/usr/bin/env python3

import os
import sys
import json
import hashlib
import subprocess

if '-c' in sys.argv:
    subprocess.check_call(sys.argv[1:])
    sys.exit(0)

if '-E' in sys.argv:
    subprocess.check_call(sys.argv[1:])
    sys.exit(0)

print(f'GIRLINK {sys.argv}', file=sys.stderr)

def flt_args(args):
    for x in args:
        if x.startswith('-L/'):
            pass
        elif x.startswith('-l'):
            pass
        elif '/obj/' in x and x.endswith('.a') and 'Telegram' not in x:
            pass
        else:
            yield x

subprocess.check_call(['dynlink'] + list(flt_args(sys.argv[1:])))
#subprocess.check_call(['dynlink', sys.argv[1], '-Wl,--whole-archive', '-Wl,--no-as-needed', '-Wl,-z,muldefs'] + sys.argv[2:])
