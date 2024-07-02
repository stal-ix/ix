{% extends '//die/inline/program.sh' %}

{% block bld_libs %}
lib/c
lib/c++
lib/icu
{% endblock %}

{% block name %}
test_brk
{% endblock %}

{% block sources %}
main.cpp
{% endblock %}
