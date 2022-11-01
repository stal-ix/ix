{% extends '//die/inline/program.sh' %}

{% block bld_libs %}
lib/c
lib/c++
lib/execinfo
{% endblock %}

{% block name %}
test
{% endblock %}

{% block sources %}
main.cpp
{% endblock %}
