#!/usr/bin/env python3

import os
import sys
import subprocess

def split_input():
    part = []

    for l in sys.stdin.read().split('\n'):
        if l.startswith('---'):
            yield part
            part = []

        part.append(l)
    if part:
        yield part

def it_chunks():
    for part in split_input():
        data = '\n'.join(part) + '\n'

        if '---' in data:
            yield data

for d in it_chunks():
    subprocess.run(sys.argv[1:], input=d.encode(), check=True)
