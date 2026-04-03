#!/usr/bin/env python3
import json, sys, os

g = json.load(open(sys.argv[1] if len(sys.argv) > 1 else '../g'))
g1 = json.load(open(sys.argv[2] if len(sys.argv) > 2 else '../g1'))

print(f"nodes: {len(g['nodes'])} vs {len(g1['nodes'])}")

py_uids = {n['uid'] for n in g['nodes']}
go_uids = {n['uid'] for n in g1['nodes']}
common = py_uids & go_uids
print(f"common: {len(common)}, py_only: {len(py_uids - go_uids)}, go_only: {len(go_uids - py_uids)}")

if py_uids == go_uids:
    print("MATCH!")
    sys.exit(0)

def pkg_name(n):
    dirs = n.get('out_dir', [])
    if not dirs: return ''
    d = dirs[0] if isinstance(dirs, list) else dirs
    parts = d.split('/')
    if len(parts) >= 4:
        s = parts[3]
        idx = s.index('-') if '-' in s else len(s)
        return s[idx+1:]
    return d

# Index by pkg name
py_by_name = {}
for n in g['nodes']:
    name = pkg_name(n)
    if name:
        py_by_name.setdefault(name, []).append(n)

go_by_name = {}
for n in g1['nodes']:
    name = pkg_name(n)
    if name:
        go_by_name.setdefault(name, []).append(n)

# Find build nodes (slot/full) where UID differs but ALL in_dir deps have matching UIDs
# This finds the "root cause" nodes
def dep_uids(n):
    """Extract UIDs from in_dir paths."""
    uids = set()
    for d in n.get('in_dir', []):
        parts = d.split('/')
        if len(parts) >= 4:
            s = parts[3]
            idx = s.index('-') if '-' in s else len(s)
            uids.add(s[:idx])
    return uids

roots = []
for name in sorted(set(py_by_name) & set(go_by_name)):
    for pn in py_by_name[name]:
        if pn['uid'] in common:
            continue
        if pn['pool'] not in ('slot', 'full'):
            continue
        # Check if all deps match
        pdeps = dep_uids(pn)
        if pdeps and pdeps.issubset(common):
            # Find corresponding go node
            for gn in go_by_name[name]:
                if gn['pool'] == pn['pool']:
                    roots.append((name, pn, gn))

print(f"\nroot cause nodes (all deps match but own uid differs): {len(roots)}")
for name, pn, gn in roots[:5]:
    print(f"\n  {name}: py={pn['uid']} go={gn['uid']}")
    print(f"    pool: {pn['pool']}")
    print(f"    in_dir count: {len(pn.get('in_dir',[]))} vs {len(gn.get('in_dir',[]))}")

    # Compare in_dir
    pi = set(pn.get('in_dir', []))
    gi = set(gn.get('in_dir', []))
    if pi != gi:
        only_py = pi - gi
        only_go = gi - pi
        if only_py:
            print(f"    in_dir only in py: {sorted(only_py)[:3]}")
        if only_go:
            print(f"    in_dir only in go: {sorted(only_go)[:3]}")

    # Compare cmd stdin
    ps = pn['cmd'][0].get('stdin', '')
    gs = gn['cmd'][0].get('stdin', '')
    if ps != gs:
        print(f"    stdin differs: {len(ps)} vs {len(gs)} chars")
        # Show first difference
        for i in range(min(len(ps), len(gs))):
            if ps[i] != gs[i]:
                ctx = 40
                print(f"    first diff at {i}:")
                print(f"      py: ...{repr(ps[max(0,i-ctx):i+ctx])}...")
                print(f"      go: ...{repr(gs[max(0,i-ctx):i+ctx])}...")
                break
        else:
            if len(ps) != len(gs):
                print(f"    shorter one ends, extra: {repr(ps[len(gs):len(gs)+80] if len(ps)>len(gs) else gs[len(ps):len(ps)+80])}")
    else:
        print(f"    stdin: matches ({len(ps)} chars)")

    # Compare cmd args
    pa = pn['cmd'][0].get('args', [])
    ga = gn['cmd'][0].get('args', [])
    if pa != ga:
        print(f"    args differ: {pa} vs {ga}")

    # Compare env keys
    pe = pn['cmd'][0].get('env', {})
    ge = gn['cmd'][0].get('env', {})
    for k in sorted(set(list(pe.keys()) + list(ge.keys()))):
        pv = pe.get(k, '<missing>')
        gv = ge.get(k, '<missing>')
        if pv != gv:
            print(f"    env {k} differs")

# Also check: names only in one side
py_only_names = sorted(set(py_by_name) - set(go_by_name))
go_only_names = sorted(set(go_by_name) - set(py_by_name))
if py_only_names:
    print(f"\npkg names only in python: {py_only_names}")
if go_only_names:
    print(f"pkg names only in go: {go_only_names}")
