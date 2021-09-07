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


subprocess.run([mix.which('dash')], input=('\n'.join(iter_lines())).encode(), check=True)


{% block body %}{% endblock %}
