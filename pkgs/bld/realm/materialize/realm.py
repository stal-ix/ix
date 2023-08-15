#!/usr/bin/env python3

import os
import sys
import json
import shutil
import subprocess


meta = json.loads(sys.stdin.read())
path = sys.argv[1]

COL = {
    'r': 31,
    'g': 32,
    'y': 33,
    'b': 34,
}

def col(v, color='r', bright=False):
    n = COL[color]

    if bright:
        n += 60

    return f'\x1b[{n}m{v}\x1b[0m'

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
    subprocess.check_call(['rsync', '-a', '--exclude=touch', fr + '/', to + '/'])

try:
    shutil.rmtree(path)
except Exception:
    pass

os.makedirs(path)
os.chdir(path)

for p in reversed(meta['links']):
    install(p, path)

subprocess.run(['chrw', path], check=True)

if os.path.isdir('fix'):
    for x in sorted(os.listdir('fix')):
        if not x.endswith('.sh'):
            continue

        print(col(f'run hooks from {x}'), file=sys.stderr)

        subprocess.run(['sh', os.path.join('fix', x)], check=True)

    shutil.rmtree('fix')

os.unlink('env')

with open('meta.json', 'w') as f:
    f.write(json.dumps(meta, indent=4, sort_keys=True))

with open('env', 'w') as f:
    f.write('\n'.join(f'. {x}/env' for x in reversed(meta['links'])) + '\n')
