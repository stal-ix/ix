#!/usr/bin/env python3

import os
import sys
import hashlib

data = sys.stdin.buffer.read()

if b'output.exe' in data:
    sys.exit(0)

with open(os.environ['tmp'] + '/linkcmd_' + hashlib.md5(data).hexdigest(), 'wb') as f:
    f.write(data)
