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

    groups[rec['pkg_name']].append(rec)

def norm_ver(v):
    for x in v.split('.'):
        try:
            yield int(x)
        except Exception as e:
            yield x

def calc_max_ver(recs):
    try:
        return list(sorted(recs, key=lambda x: list(norm_ver(x['pkg_ver']))))[-1]['pkg_ver']
    except Exception as e:
        print(recs, file=sys.stderr)
        raise e

def flt_ver(recs, ver):
    for x in recs:
        if x['pkg_ver'] == ver:
            yield x

for recs in groups.values():
    for rec in flt_ver(recs, calc_max_ver(recs)):
        print(json.dumps(rec))
