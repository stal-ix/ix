{% extends '//die/inline/program.sh' %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block name %}
halt
{% endblock %}

{% block sources %}
main.c
{% endblock %}
