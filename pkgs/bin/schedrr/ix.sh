{% extends '//die/inline/program.sh' %}

{% block bld_libs %}
lib/c
lib/shim/gnu
{% endblock %}

{% block name %}
schedrr
{% endblock %}

{% block sources %}
rr.c
{% endblock %}
