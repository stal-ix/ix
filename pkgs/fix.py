import os

T = r'''
{% extends '//mix/template/hub.sh' %}

{% block deps %}
{lst}
{% endblock %}
'''

def fix(d):
    if not d.startswith('# run'):
        return d

    v = []

    for l in d.split('\n'):
        l = l.strip()

        if not l:
            continue

        if '# run' not in l:
            return d

        v.append(l[6:])

    return T.replace('{lst}', '\n'.join(v)).strip() + '\n'


for a, b, c in os.walk('.'):
    for x in c:
        if x == 'mix.sh':
            p = os.path.join(a, x)

            with open(p, 'r') as f:
                d = f.read()

            dd = fix(d)

            if d != dd:
                print(f'fix {p}')

                with open(p, 'w') as f:
                    f.write(dd)
