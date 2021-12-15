import os


def fix(d, n):
    if '//lib/c++' in d:
        return

    if '/boot/' in n:
        return

    if 'lib/c/mix.sh' in d:
        return

    if '/mix/' in n:
        return

    return d.replace('lib/c++/mix.sh', 'lib/c/mix.sh\nlib/c++/mix.sh')


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
