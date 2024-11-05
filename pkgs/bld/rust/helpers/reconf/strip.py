#!/usr/bin/env python3

import sys
import json

data = json.loads(sys.stdin.read())

for k in sys.argv[1:]:
    if k in data:
        pp = data.pop(k)
        print('strip ' + json.dumps(pp, indent=4, sort_keys=True), file=sys.stderr)

print(json.dumps(data))
