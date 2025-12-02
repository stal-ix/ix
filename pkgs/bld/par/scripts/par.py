#!/usr/bin/env python3

import os
import sys
import json
import signal
import threading
import subprocess

def run(l):
    try:
        l = l.strip()
        rec = json.loads(l)
        subprocess.check_call(rec['cmd'])
    except Exception as e:
        print(f'{l} -> {e}', file=sys.stderr)
        #os.kill(0, signal.SIGKILL)
        os._exit(1)

def start(l):
    t = threading.Thread(target=lambda: run(l))
    t.start()
    return t

t = [start(l) for l in sys.stdin.readlines()]

for x in t:
    x.join()

if 0:
    with open('repro.sh', 'w') as f:
        for k, v in os.environ.items():
            print(f'export {k}="{v}"', file=f)

        for x in cmd:
            print(x + ' \\', file=f)
