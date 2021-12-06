import os


def fix(d):
    if ' | linux' in d:
        def it():
            for l in d.split('\n'):
                if ' | linux' in l:
                    yield "{% if target.os == 'linux' %}"

                    l = l[l.index("'") + 1:]
                    l = l[:l.index("'")]

                    yield l
                    yield "{% endif %}"
                else:
                    yield l

        return '\n'.join(it()).strip() + '\n'

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
