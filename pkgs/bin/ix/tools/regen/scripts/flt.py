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
    groups[rec['pkg_name']].append(rec)

def calc_max_ver(recs):
    return list(sorted(recs, key=lambda x: x['pkg_ver'].split('.')))[-1]['pkg_ver']

def flt_ver(recs, ver):
    for x in recs:
        if x['pkg_ver'] == ver:
            yield x

for recs in groups.values():
    for rec in flt_ver(recs, calc_max_ver(recs)):
        print(json.dumps(rec, sort_keys=True))
