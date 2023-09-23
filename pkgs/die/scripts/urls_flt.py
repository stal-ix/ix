import os
import sys

def ok(l):
    if '.' not in os.path.basename(l):
        return False

    return True

def it():
    for l in sys.stdin.read().split('\n'):
        if ok(l):
            yield l

print('\n'.join(it()).strip() + '\n')
