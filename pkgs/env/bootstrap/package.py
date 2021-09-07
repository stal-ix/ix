{% extends '//util/env.py' %}

{% block env %}
export untar="$exe $mix misc untar"
export unzip="$exe $mix misc unzip"
{% endblock %}
