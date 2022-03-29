#!/usr/bin/env python3

import sys
import shutil
import subprocess

ar = sys.argv[1]

def lst(p):
    for x in subprocess.check_output(['llvm-ar', 't', p]).decode().split('\n'):
        x = x.strip()

        if x:
            yield x

def extr1(p, o, n):
    subprocess.check_output(['llvm-ar', '-xN', str(n), p, o], stderr=subprocess.STDOUT)
    shutil.move(o, f'{ar}_{n}_{o}'.replace('.', '_') + '.o')

def extr(p, o):
    for i in range(1, 100):
        try:
            extr1(p, o, i)
        except Exception:
            return

for s in lst(ar):
    extr(ar, s)
