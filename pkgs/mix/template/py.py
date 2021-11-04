{% extends 'mix.json' %}

{% block script_body %}
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
{% endblock %}

{% block script_kind %}py{% endblock %}
