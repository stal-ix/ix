{% extends '//die/inline/program.sh' %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block sources %}
cwd.c
{% endblock %}

{% block name %}
setcwd
{% endblock %}
