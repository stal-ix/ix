import os


def fix1(d, n):
    if '/refactor/' in n:
        return

    if '/template/' in n:
        return

    def it():
        inf = False

        for l in d.split('\n'):
            if 'block meson_flags' in l:
                inf = True
            elif inf:
                if 'endblock' in l:
                    inf = False
                else:
                    assert '{' not in l
                    assert l.startswith('-D')

                    l = l[2:]

            yield l

    return '\n'.join(it()).strip() + '\n'


def fix(d, n):
    def it():
        for l in d.split('\n'):
            if 'extends' in l or 'include' in l:
                yield l
            else:
                yield l.replace('/ix.sh', '')

    return '\n'.join(it()).strip() + '\n'


for a, b, c in os.walk('.'):
    for x in c:
        if '.sh' in x:
            p = os.path.join(a, x)

            with open(p, 'r') as f:
                d = f.read()

            try:
                dd = fix1(d, p)
            except Exception as e:
                print(f'skip {p}, {e}')
                dd = None

            if dd and d != dd:
                print(f'fix {p}')

                with open(p, 'w') as f:
                    f.write(dd)
