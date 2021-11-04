import os


def fix(d):
    return d


for a, b, c in os.walk('.'):
    for x in c:
        if x == 'mix.sh':
            p = os.path.join(a, x)

            with open(p, 'r') as f:
                d = f.read()

            dd = fix(d)

            if d != dd:
                print(f'fix {p}')

                with open(p, 'w') as f:
                    f.write(dd)
