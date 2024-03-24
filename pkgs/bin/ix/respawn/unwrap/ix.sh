{% extends '//die/inline/program.sh' %}

{% block bld_libs %}
{% if linux %}
lib/bumpalloc
lib/musl/naked
{% else %}
lib/c
{% endif %}
{% endblock %}

{% block name %}
ix
{% endblock %}

{% block cpp_defines %}
_GNU_SOURCE=1
{% endblock %}

{% block sources %}
main.c
{% endblock %}
