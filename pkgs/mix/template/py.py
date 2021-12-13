{% extends 'script.json' %}

{% block script_body %}
import os

{% block build %}
import subprocess

DATA = r"""
{% block script %}
{% endblock %}
""".strip()

def iter_lines():
    yield 'set -e'
    yield 'set -x'

    for p in reversed(os.environ['PATH'].split(':')):
        pp = os.path.normpath(os.path.join(p, '..', 'env'))

        if os.path.isfile(pp):
            yield '. ' + pp

    yield DATA

if DATA:
    tmp = os.path.join(os.environ['tmp'], 'tmp')
    os.makedirs(tmp)
    os.environ['TMPDIR'] = tmp
    subprocess.run([mix.which('dash')], input=('\n'.join(iter_lines()) + '\n').encode(), check=True)
{% endblock %}

env_data = r"""
{% block env %}
{% endblock %}
"""

with open(os.environ['out'] + '/env', 'a') as f:
    f.write(env_data)

import os

os._exit(0)
{% endblock %}

{% block script_kind %}
py
{% endblock %}
