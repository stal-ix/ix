#!/usr/bin/env python3

import os
import sys
import json
import base64

def it_items(p):
    for a, b, c in os.walk(p):
        for f in c:
            fp = os.path.join(a, f)
            ff = fp[len(p) + 1:]

            if os.path.islink(fp):
                yield {
                    'type': 'symlink',
                    'from': os.readlink(fp),
                    'path': ff,
                }
            else:
                with open(fp, 'rb') as fd:
                    d = fd.read()

                flags = []

                if os.access(fp, os.X_OK):
                    flags.append('exe')

                yield {
                    'type': 'file',
                    'data': base64.b64encode(d).decode(),
                    'path': ff,
                    'flags': flags,
                }

for rec in sorted(it_items(os.path.abspath(sys.argv[1])), key=lambda x: (x['type'], x['path'])):
    print(json.dumps(rec, sort_keys=True))
