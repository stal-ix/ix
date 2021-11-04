{% extends 'mix.json' %}

{% block script_body %}
import os

{% block build %}
import subprocess

DATA = r"""
{% block script %}{% endblock %}
"""

def iter_lines():
    yield 'set -e'
    yield 'set -x'

    for p in reversed(os.environ['PATH'].split(':')):
        pp = os.path.normpath(os.path.join(p, '..', 'env'))

        if os.path.isfile(pp):
            yield '. ' + pp

    yield DATA

if DATA.strip():
    tmp = os.path.join(os.environ['tmp'], 'tmp')
    os.makedirs(tmp)
    os.environ['TMPDIR'] = tmp
    subprocess.run([mix.which('dash')], input=('\n'.join(iter_lines())).encode(), check=True)
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
