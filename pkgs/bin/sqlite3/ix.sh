{% extends '//lib/sqlite/3/t/ix.sh' %}

{% block bld_libs %}
lib/z
lib/readline
{{super()}}
{% endblock %}
