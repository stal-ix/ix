import os
import sys

mirrors = [x.split('://')[1] for x in open('mirrors.txt').read().splitlines()]

def ok(l):
    for m in mirrors:
        if m in l:
            return False

    if 'readline' in os.path.basename(l):
        return True

    if '.' not in os.path.basename(l):
        return False

    return True

def it():
    for l in sys.stdin.read().split('\n'):
        l = l.strip()

        if l and ok(l):
            yield l

print('\n'.join(sorted(frozenset(it()))).strip() + '\n')
