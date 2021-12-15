import os


def fix(d, n):
    return d.replace('%}lib', '%}\nlib').replace('mix.sh{%', 'mix.sh\n{%')


for a, b, c in os.walk('.'):
    for x in c:
        if '.sh' in x:
            p = os.path.join(a, x)

            with open(p, 'r') as f:
                d = f.read()

            dd = fix(d, p)

            if d != dd:
                print(f'fix {p}')

                with open(p, 'w') as f:
                    f.write(dd)
