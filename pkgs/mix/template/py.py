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
{% include 'run_sh_script.py' %}
{% endblock %}

import os

env_data = r"""
{% block env %}
{% endblock %}
"""

with open(os.environ['out'] + '/env', 'a') as f:
    f.write(env_data)
{% endset %}

def package(mix):
    fetch = r'''{% block fetch %}{% endblock %}'''

    return {
        'build': {
            'fetch': mix.parse_sh(fetch).get('build', {}).get('fetch', []),
            'script': {
                'data': r'''{{build_script}}''',
                'kind': 'py',
            },
            'depends': {{mix.list_to_json(lib_deps + ' ' + bld_deps)}},
        },
        'runtime': {
            'depends': {{mix.list_to_json(lib_deps + ' ' + run_deps)}},
        },
    }
