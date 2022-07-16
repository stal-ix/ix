{% extends '//die/inline/program.sh' %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block name %}
urldec
{% endblock %}

{% block sources %}
dec.c
{% endblock %}
