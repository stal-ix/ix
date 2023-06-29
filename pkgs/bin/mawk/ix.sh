{% extends 'lite/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/readline
{% endblock %}
