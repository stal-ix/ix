#!/usr/bin/env python3

import sys
import json
import collections

groups = collections.defaultdict(list)

for l in sys.stdin.read().split('\n'):
    l = l.strip()

    if not l:
        continue

    rec = json.loads(l)

    if rec['ix_pkg_name'].startswith('bld/'):
        continue

    if len(rec['pkg_ver']) == 40:
        continue

    with open('pkgs/' + rec['ix_pkg_full_name'] + '/ix.sh') as f:
        data = f.read()

        if 'cargo_sha' in data:
            if 'bld/cargo/86' not in data:
                groups[rec['pkg_name']].append(rec)

for k in sorted(groups.keys()):
    recs = groups[k]
    ver = recs[0]['pkg_ver']

    print(' '.join(x['ix_pkg_full_name'] for x in recs))
