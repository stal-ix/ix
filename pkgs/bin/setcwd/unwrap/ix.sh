{% extends '//die/inline/program.sh' %}

{% block bld_libs %}
lib/tiny
{% endblock %}

{% block sources %}
cwd.c
{% endblock %}

{% block name %}
setcwd
{% endblock %}
