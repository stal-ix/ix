{% extends '//die/inline/program.sh' %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block sources %}
lin.c
{% endblock %}

{% block name %}
liner
{% endblock %}
