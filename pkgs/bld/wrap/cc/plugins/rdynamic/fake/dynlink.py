#!/usr/bin/env python3

import os
import sys
import json

def flt_args(args):
    for x in args:
        if '-rdynamic' in x:
            pass
        elif '-export-dynamic' in x:
            pass
        else:
            yield x

sys.stdout.write(json.dumps({
    'cmd': list(flt_args(json.loads(sys.stdin.read())['cmd'])),
}))
