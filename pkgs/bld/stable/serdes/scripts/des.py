#!/usr/bin/env python3

import os
import sys
import json
import base64

for l in sys.stdin.readlines():
    rec = json.loads(l)
    rt = rec['type']
    if rt == 'file':
        p = rec['path']
        try:
            os.makedirs(os.path.dirname(p))
        except OSError:
            pass
        with open(p, 'wb') as f:
            f.write(base64.b64decode(rec['data'].encode()))

        if 'exe' in rec.get('flags'):
            os.chmod(p, 0o744)
        else:
            os.chmod(p, 0o644)
    elif rt == 'symlink':
        os.symlink(rec['from'], rec['path'])
