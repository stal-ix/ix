#!/usr/bin/env python3

import os
import sys
import json

for l in sys.stdin.read().split('\n'):
    l = l.strip()

    if not l:
        continue

    for x in json.loads(l)['upstream_urls']:
        print(x)
