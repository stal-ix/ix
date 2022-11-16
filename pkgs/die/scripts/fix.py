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
            if len(l) == 32:
                try:
                    bytes.fromhex(l)
                    yield 'md5:' + l
                except Exception:
                    yield l
            else:
                yield l

    return '\n'.join(it()).strip() + '\n'

def fix2(d, p):
    def it():
        for l in d.split('\n'):
            if l == 'lib/linux':
                yield 'lib/kernel'
            else:
                yield l

    return '\n'.join(it()).strip() + '\n'

for a, b, c in os.walk('.'):
    for x in c:
        if '.sh' in x:
            p = os.path.join(a, x)

            with open(p, 'r') as f:
                d = f.read()

            try:
                dd = fix2(d, p)
            except Exception as e:
                print(f'skip {p}, {e}, {repr(e)}')
                dd = None

            if dd and d != dd:
                print(f'fix {p}')

                with open(p, 'w') as f:
                    f.write(dd)
