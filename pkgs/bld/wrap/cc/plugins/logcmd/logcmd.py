#!/usr/bin/env python3

import os
import sys
import json
import hashlib

if os.environ.get('IX_STEP', '') == 'configure':
    sys.exit(0)

data = sys.stdin.buffer.read()

cmd = json.loads(data)['cmd']

if '-o' in cmd:
    with open(os.environ['tmp'] + '/linkcmd_' + hashlib.md5(data).hexdigest(), 'wb') as f:
        f.write(data)
