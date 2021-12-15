import os


def fix(d, n):
    if 'hub.sh' in d:
        return d

    if 'proxy.sh' in d:
        return d

    if 'py.py' in d:
        return d

    if '/mix/' in n:
        return d

    if 'lib/c/' in d:
        return d

    if 'lib/c++/' in d:
        return d

    if 'boot/final/cxx/' in d:
        return d

    if '/boot/' in n:
        return d

    if 'block bld_libs' in d:
        return d.replace('bld_libs %}', 'bld_libs %}\nlib/c/mix.sh')

    if 'block lib_deps' in d:
        return d.replace('lib_deps %}', 'lib_deps %}\nlib/c/mix.sh')

    if '/lib/' in n:
        return d + '\n{% block lib_deps %}lib/c/mix.sh{% endblock %}\n'

    return d + '\n{% block bld_libs %}lib/c/mix.sh{% endblock %}\n'


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
