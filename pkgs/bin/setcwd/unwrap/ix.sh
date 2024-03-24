{% extends '//die/inline/program.sh' %}

{% block bld_libs %}
{% if linux %}
lib/bumpalloc
lib/musl/naked
{% else %}
lib/c
{% endif %}
{% endblock %}

{% block sources %}
cwd.c
{% endblock %}

{% block name %}
setcwd
{% endblock %}
