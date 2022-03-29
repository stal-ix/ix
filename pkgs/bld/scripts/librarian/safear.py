#!/usr/bin/env python3

import sys
import subprocess

def lst(o):
    for x in subprocess.check_output(['llvm-nm', '--extern-only', '--no-demangle', '--no-weak', '--defined-only', '--print-file-name', o]).decode().split('\n'):
        x = x.strip()

        if not x:
            continue

        yield x[x.index(' ') + 1:]

v = set()

def good(o):
    for s in lst(o):
        if s in v:
            return False

        v.add(s)

    return True

def it_good():
    for o in sys.argv[2:]:
        if good(o):
            yield o
        else:
            print(f'skip {o}')

subprocess.check_call(['llvm-ar', 'q', sys.argv[1]] + list(it_good()))
