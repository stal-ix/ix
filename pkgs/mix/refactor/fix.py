import os


def fix(d):
    if 'box/boot' in d:
        return d.replace('std/env/0', 'box/boot').replace('std_env', 'std_box')

    return d

for a, b, c in os.walk('.'):
    for x in c:
        if '.sh' in x:
            p = os.path.join(a, x)

            with open(p, 'r') as f:
                d = f.read()

            dd = fix(d)

            if d != dd:
                print(f'fix {p}')

                with open(p, 'w') as f:
                    f.write(dd)
