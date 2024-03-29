#!/usr/bin/env

import os
import sys
import json
import base64

for l in sys.stdin.readlines():
    rec = json.loads(l)
    rt = rec['type']
    if rt == 'file':
        p = rec['path']

        with open(p, 'wb') as f:
            f.write(base64.b64decode(rec['data'].encode()))

        if 'exe' in rec.get('flags'):
            os.chmod(p, 0o544)
        else:
            os.chmod(p, 0o444)
    elif rt == 'symlink':
        os.symlink(rec['from'], rec['path'])
