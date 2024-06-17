#!/bin/python3

import os
import sys
import json
import time
import hashlib
import threading
import subprocess

where = sys.argv[-1]
running = {}

def log(s):
    print(s, file=sys.stderr)

def shash(s):
    return hashlib.md5(json.dumps(s, sort_keys=True).encode()).hexdigest()

def readf(p):
    with open(p, 'r') as f:
        return f.read()

def step():
    for md5, proc in list(running.items()):
        if proc.poll() is None:
            log(f'{md5} alive')
        else:
            log(f'{md5} dead')
            running.pop(md5)

    cur = []

    for d in os.listdir(where):
        p = os.path.join(where, d, 'run')

        try:
            md5 = shash([p, readf(p)])

            if md5 in running:
                log(f'{p} already running as {md5}')
            else:
                log(f'spawn {p} as {md5}')
                running[md5] = subprocess.Popen([p])

            cur.append(md5)
        except Exception as e:
            log(f'skip {p}: {e}')

    cur = frozenset(cur)

    for md5, proc in list(running.items()):
        if md5 not in cur:
            log(f'{md5} stale')
            proc.terminate()

while True:
    try:
        step()
    except Exception as e:
        log(f'step error {e}')

    time.sleep(1)
