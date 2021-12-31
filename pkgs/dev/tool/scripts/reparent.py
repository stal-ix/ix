import os
import sys

def it_1(d):
    for a, b, c in os.walk(d):
        for x in c:
            yield os.path.join(a, x)

def it(lst):
    for d in lst:
        yield from it_1(d)

fr = os.path.basename(sys.argv[1])
to = os.path.basename(sys.argv[2])

def fix(d):
    return d.replace(fr, to)

ok = False

def should_fix(p):
    if p.endswith('.h'):
        return True

    if p.endswith('.ninja'):
        return True

    return False

for p in it(sys.argv[3:]):
    if not should_fix(p):
        continue

    with open(p, 'r') as f:
        d = f.read()

    if nd := fix(d):
        if nd != d:
            print(f'fixed {p}')

            ok = True

            with open(p, 'w') as f:
                f.write(nd)

if not ok:
    raise Exception('no fix applied!')
