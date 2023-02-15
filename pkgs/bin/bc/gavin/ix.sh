{% extends 't/ix.sh' %}

{% block bld_libs %}
lib/c
lib/readline
{% endblock %}

{% block configure_flags %}--enable-readline{% endblock %}
