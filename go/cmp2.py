#!/usr/bin/env python3
"""Find root cause: a build node whose all deps match but stdin differs."""
import json, sys, os, difflib

g = json.load(open(sys.argv[1] if len(sys.argv) > 1 else '../g'))
g1 = json.load(open(sys.argv[2] if len(sys.argv) > 2 else '../g1'))

py_uids = {n['uid'] for n in g['nodes']}
go_uids = {n['uid'] for n in g1['nodes']}
common = py_uids & go_uids
print(f"common: {len(common)}, py_only: {len(py_uids - go_uids)}, go_only: {len(go_uids - py_uids)}")

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

def dep_uids(n):
    uids = set()
    for d in n.get('in_dir', []):
        parts = d.split('/')
        if len(parts) >= 4:
            s = parts[3]
            idx = s.index('-') if '-' in s else len(s)
            uids.add(s[:idx])
    return uids

# Find nodes where all deps are in common set but stdin differs
py_by_name = {}
for n in g['nodes']:
    name = pkg_name(n)
    if name and n['pool'] in ('slot', 'full'):
        py_by_name.setdefault(name, []).append(n)

go_by_name = {}
for n in g1['nodes']:
    name = pkg_name(n)
    if name and n['pool'] in ('slot', 'full'):
        go_by_name.setdefault(name, []).append(n)

# Find root causes where stdin actually differs (not just uid cascade)
for name in sorted(set(py_by_name) & set(go_by_name)):
    for pn in py_by_name[name]:
        if pn['uid'] in common:
            continue
        pdeps = dep_uids(pn)
        if not pdeps.issubset(common):
            continue
        # All deps match - this is a root cause
        for gn in go_by_name[name]:
            gdeps = dep_uids(gn)
            if not gdeps.issubset(common):
                continue
            # Both have all deps matching
            ps = pn['cmd'][0].get('stdin', '')
            gs = gn['cmd'][0].get('stdin', '')
            if ps != gs:
                print(f"\n=== {name}: stdin differs (py={len(ps)} go={len(gs)}) ===")
                # Show unified diff of first 100 lines
                pl = ps.split('\n')
                gl = gs.split('\n')
                diff = list(difflib.unified_diff(pl[:200], gl[:200], lineterm='', n=2))
                for line in diff[:40]:
                    print(line)
                sys.exit(0)
            elif pn.get('in_dir') != gn.get('in_dir'):
                print(f"\n=== {name}: in_dir differs (stdin matches) ===")
                pi = set(pn.get('in_dir', []))
                gi = set(gn.get('in_dir', []))
                print(f"  only py: {sorted(pi - gi)[:5]}")
                print(f"  only go: {sorted(gi - pi)[:5]}")
                sys.exit(0)

print("No root stdin diffs found - issue is purely uid cascade or in_dir")
