import os


def fix(d, n):
    def it():
        for l in d.split('\n'):
            if l.strip() in ('set -eu', 'set -ue'):
                pass
            else:
                yield l

    return '\n'.join(it()).strip() + '\n'


for a, b, c in os.walk('.'):
    for x in c:
        if '.sh' in x:
            p = os.path.join(a, x)

            with open(p, 'r') as f:
                d = f.read()

            dd = fix(d, p)

            if dd and d != dd:
                print(f'fix {p}')

                with open(p, 'w') as f:
                    f.write(dd)
