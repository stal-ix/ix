#!/usr/bin/env python3

import os
import sys
import json
import shutil
import subprocess


meta = json.loads(sys.stdin.read())
path = sys.argv[1]


def iter_dir_1(w):
    for a, b, c in os.walk(w):
        for x in c:
            yield os.path.join(a, x)

        for x in b:
            dl = os.path.join(a, x)

            if os.path.islink(dl):
                yield dl

def iter_dir(w):
    for x in iter_dir_1(w):
        yield x[len(w) + 1:]

def install(fr, to):
    for x in iter_dir(fr):
        if '/' not in x:
            continue

        # print(f'{fr} {x} {to}')
        p = os.path.join(to, x)

        try:
            os.makedirs(os.path.dirname(p))
        except Exception:
            pass

        try:
            os.unlink(p)
        except FileNotFoundError:
            pass

        pf = os.path.join(fr, x)
        # print(f'symlink {pf} -> {p}')
        os.symlink(pf, p)


try:
    shutil.rmtree(path)
except Exception:
    pass

os.makedirs(path)
os.chdir(path)

for p in reversed(meta['links']):
    install(p, path)

if os.path.isdir('fix'):
    for x in sorted(os.listdir('fix')):
        if not x.endswith('.sh'):
            continue

        print(f'run hooks from {x}')

        subprocess.run(['sh', os.path.join('fix', x)], check=True)

    shutil.rmtree('fix')

with open('meta.json', 'w') as f:
    f.write(json.dumps(meta, indent=4, sort_keys=True))

with open('env', 'w') as f:
    f.write('\n'.join(f'. {x}/env' for x in reversed(meta['links'])) + '\n')
