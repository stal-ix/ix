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
{% include 'std/functions.sh' %}
"""

def iter_lines():
    yield 'set -e'
    yield 'set -x'

    for p in os.environ['MIX_B_DIR'].split(':'):
        yield '. ' + os.path.join(p, 'env')

    for p in os.environ['MIX_T_DIR'].split(':'):
        yield '. ' + os.path.join(p, 'env')

    yield EXTR
    yield DATA

if DATA:
    tmp = os.path.join(os.environ['tmp'], 'tmp')
    os.makedirs(tmp)
    os.environ['TMPDIR'] = tmp
    subprocess.run([mix.which('dash')], input=('\n'.join(iter_lines()) + '\n').encode(), check=True)
{% endblock %}

env_data = r"""
export PATH="{outdir}/bin:${PATH}"
{% block env %}
{% endblock %}
"""

outdir = os.environ['out']

with open(outdir + '/env', 'a') as f:
    f.write(env_data.replace('{outdir}', outdir))
{% endblock %}

{% block script_kind %}
py
{% endblock %}
