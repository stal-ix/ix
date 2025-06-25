{% extends '//die/inline/program.sh' %}

{% block lib_deps %}
lib/c
lib/dlfcn
{% endblock %}

{% block sources %}
test.cpp
{% endblock %}

{% block name %}
test
{% endblock %}
