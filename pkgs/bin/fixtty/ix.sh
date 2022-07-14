{% extends '//die/inline/program.sh' %}

{% block bld_libs %}
lib/c
lib/linux
{% endblock %}

{% block name %}
fixtty
{% endblock %}

{% block sources %}
main.c
{% endblock %}
