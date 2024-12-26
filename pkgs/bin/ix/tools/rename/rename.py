import os
import sys


def fix(d):
    return d.replace(sys.argv[1], sys.argv[2])


for a, b, c in os.walk('.'):
    for x in c:
        p = os.path.join(a, x)

        with open(p, 'r') as f:
            d = f.read()

        dd = fix(d)

        if d != dd:
            print(f'fix {p}')

            with open(p, 'w') as f:
                f.write(dd)
