import json


PYPI = json.loads(parent.serve('pypi.json'))


TMPL = '''
{% extends '//util/template.sh' %}

{% block fetch %}
# url {url}
# md5 {md5}
{% endblock %}

{% block deps %}
# bld dev/lang/python/3/minimal env/std
# run {run}
{% endblock %}

{% block unpack %}
{% endblock %}

{% block build %}
mkdir -p ${out}/lib/python && cd ${out}/lib/python && ${untar} ${src}/*.whl

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
export PYTHONPATH="${out}/lib/python:\${PYTHONPATH}"
{% endblock %}
'''


def gen_pkg(rec):
    t = TMPL

    t = t.replace('{url}', rec['url'])
    t = t.replace('{md5}', rec['md5'])
    t = t.replace('{run}', ' '.join(rec.get('run', [])))

    return t


def serve(x):
    try:
        return gen_pkg(PYPI[x])
    except KeyError:
        raise FileNotFoundError(x)
