{% extends '//die/inline/program.sh' %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block sources %}
pwd.c
{% endblock %}

{% block name %}
setpwd
{% endblock %}
