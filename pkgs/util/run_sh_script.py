import os
import subprocess


DATA = r'''
{% block script %}{% endblock %}
'''


def iter_lines():
    yield 'set -e'
    yield 'set -x'

    for p in reversed(os.environ['PATH'].split(':')):
        pp = os.path.normpath(os.path.join(p, '..', 'env'))

        if os.path.isfile(pp):
            yield '. ' + pp

    yield DATA


# prepare tmp dir
tmp = os.path.join(os.environ['tmp'], 'tmp')
os.makedirs(tmp)
os.environ['TMPDIR'] = tmp

subprocess.run([mix.which('dash')], input=('\n'.join(iter_lines())).encode(), check=True)
