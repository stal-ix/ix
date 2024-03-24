{% extends '//die/inline/program.sh' %}

{% block bld_libs %}
lib/tiny
{% endblock %}

{% block name %}
subreaper
{% endblock %}

{% block sources %}
main.c
{% endblock %}
