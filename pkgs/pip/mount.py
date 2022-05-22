import json


PYPI = json.loads(parent.serve('pypi.json'))


TMPL = r'''
{% extends '//die/std/ix.sh' %}

{% block fetch %}
{url}
{md5}
{% endblock %}

{% block bld_tool %}
bld/python/ix.sh
{% endblock %}

{% block run_deps %}
{run}
{% endblock %}

{% block unpack %}
mkdir -p ${out}/lib
cd ${out}/lib
extract0 ${src}/*.whl
{% endblock %}

{% block build %}
python3 << EOF > exports
import os
import sys

d = os.getcwd()

for a, b, c in os.walk(d):
    print(f'try {a}', file=sys.stderr)

    if not os.path.isfile(os.path.join(a, '__init__.py')):
        print(f'not a module: {a}', file=sys.stderr)

        continue

    for x in c:
        if x.endswith('.py'):
            print(os.path.join(a, x)[len(d) + 1:-3].replace('/', '.'))
EOF

cat exports
{% endblock %}

{% block env %}
export PYTHONPATH="${out}/lib:\${PYTHONPATH}"
{% endblock %}
'''


def gen_pkg(rec):
    t = TMPL

    t = t.replace('{url}', rec['url'])
    t = t.replace('{md5}', rec['md5'])
    t = t.replace('{run}', ' '.join(x + '/ix.sh' for x in rec.get('run', [])))

    return t


def serve(x):
    try:
        return gen_pkg(PYPI[x])
    except KeyError:
        raise FileNotFoundError(x)
