#!/usr/bin/env python3

import sys
import json

try:
    with open(sys.argv[1], 'r') as f:
        data = json.loads(f.read())

    assert len(data['links']) > 0, 'empty realm not allowed, use ix mut --allow_empty'
except Exception as e:
    print(e, file=sys.stderr)
    sys.exit(1)
