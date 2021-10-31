import sys
import os


def fix_line(l):
    if '{{' in l:
        yield l

        return

    for x in l[6:].split(' '):
        if os.path.isfile(x + '/mix.sh'):
            yield l[:6] + x + '/mix.sh'
        else:
            yield l[:6] + x + '/package.py'


def fix(d):
    def it():
        for l in d.split('\n'):
            if '# bld' in l or '# run' in l or '# lib' in l:
                yield from fix_line(l)
            else:
                yield l

    return '\n'.join(it()).strip() + '\n'


for a, b, c in os.walk('.'):
    for x in c:
        p = os.path.join(a, x)

        if 'fix.py' in p:
            continue

        if '.sh' in p or '.py' in p:
            with open(p, 'r') as f:
                d = f.read()

            dd = fix(d)

            if dd != d:
                print(p)

                with open(p + '.tmp', 'w') as f:
                    f.write(dd)

                os.rename(p + '.tmp', p)
