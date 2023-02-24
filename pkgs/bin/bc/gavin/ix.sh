{% extends 't/ix.sh' %}

{% block bld_libs %}
lib/c
lib/readline
{% endblock %}

{% block bld_tool %}
bld/bc
{{super()}}
{% endblock %}

{% block configure_flags %}--enable-readline{% endblock %}
