#!/usr/bin/env python3

import sys
import json

def flt_args(cmd):
    s = set()

    for x in cmd:
        if x.endswith('.o') and x in s:
            pass
        else:
            s.add(x)

            yield x

sys.stdout.write(json.dumps({
    'cmd': list(flt_args(json.loads(sys.stdin.read())['cmd']))
}))
