{% extends '//die/inline/program.sh' %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block name %}
asan_test
{% endblock %}

{% block sources %}
main.cpp
{% endblock %}
