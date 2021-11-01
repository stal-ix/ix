{% set bld_deps %}
{% block bld_deps %}
{% endblock %}
{% endset %}

{% set lib_deps %}
{% block lib_deps %}
{% endblock %}
{% endset %}

{% set run_deps %}
{% block run_deps %}
{% endblock %}
{% endset %}

{% set build_script %}
{% block build %}
{% endblock %}

import os

env_data = r"""
{% block env %}
{% endblock %}
"""

with open(os.environ['out'] + '/env', 'w') as f:
    f.write(env_data)
{% endset %}

def package(mix):
    return {
        'build': {
            'script': {
                'data': r'''{{build_script}}''',
                'kind': 'py',
            },
            'depends': [
                {{mix.py_string_list(lib_deps + bld_deps)}}
            ],
        },
        'runtime': {
            'depends': [
                {{mix.py_string_list(lib_deps + run_deps)}}
            ],
        },
    }
