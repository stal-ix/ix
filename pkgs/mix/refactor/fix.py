import os


def fix(d, n):
    if 'lib_deps' in d:
        return

    if 'bld_libs' in d:
        d = d.replace('lib/c/mix.sh\n', '')
        d = d + '\n{% block lib_deps %}\nlib/c/mix.sh\n{% endblock %}'

        return d


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
