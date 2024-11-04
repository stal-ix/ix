#!/usr/bin/env python3

import sys
import json

data = json.loads(sys.stdin.read())

if 'profile' in data:
    pp = data.pop('profile')
    print('strip ' + json.dumps(pp, indent=4, sort_keys=True), file=sys.stderr)

print(json.dumps(data))
