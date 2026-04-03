#!/usr/bin/env python3
import json, sys

g = json.load(open(sys.argv[1] if len(sys.argv) > 1 else '../g'))
g1 = json.load(open(sys.argv[2] if len(sys.argv) > 2 else '../g1'))

py = {n['uid']: n for n in g['nodes']}
go = {n['uid']: n for n in g1['nodes']}

for uid in sorted(set(py) - set(go)):
    n = py[uid]
    print(f"py only: uid={uid} pool={n['pool']} out_dir={n.get('out_dir',['?'])[0][:60]}")

for uid in sorted(set(go) - set(py)):
    n = go[uid]
    print(f"go only: uid={uid} pool={n['pool']} out_dir={n.get('out_dir',['?'])[0][:60]}")

# Compare the mismatched nodes
py_only = [py[u] for u in set(py) - set(go)]
go_only = [go[u] for u in set(go) - set(py)]
if py_only and go_only:
    pn = py_only[0]
    gn = go_only[0]
    # Compare cmd stdin
    ps = json.dumps(pn['cmd'], sort_keys=True)
    gs = json.dumps(gn['cmd'], sort_keys=True)
    if ps == gs:
        print("cmd matches")
    else:
        print(f"cmd differs: {len(ps)} vs {len(gs)}")
    # Compare in_dir
    pi = set(pn.get('in_dir', []))
    gi = set(gn.get('in_dir', []))
    if pi == gi:
        print("in_dir matches")
    else:
        print(f"in_dir: py_only={len(pi-gi)} go_only={len(gi-pi)}")
        for d in sorted(pi - gi)[:3]:
            print(f"  py: {d}")
        for d in sorted(gi - pi)[:3]:
            print(f"  go: {d}")
