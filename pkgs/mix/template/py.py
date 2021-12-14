{% extends 'script.json' %}

{% block script_body %}
import os

{% block build %}
import subprocess

DATA = r"""
{% block script %}
{% endblock %}
""".strip()

EXTR = r"""
{% include 'blocks/extract.sh' %}
"""

def iter_lines():
    yield 'set -e'
    yield 'set -x'

    for p in os.environ['MIX_ENVPATH'].split(':'):
        yield '. ' + os.path.normpath(os.path.join(p, '..', 'env'))

    yield EXTR
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
{% endblock %}

{% block script_kind %}
py
{% endblock %}
