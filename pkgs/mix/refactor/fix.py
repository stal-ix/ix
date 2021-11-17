import os


def fix(d):
    if '/lib.sh' in d:
        d = d.replace('lib.sh', 'hub.sh').replace('block deps', 'block lib_deps')

    if '/hub.sh' in d:
        d = d.replace('block deps', 'block run_deps')

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
