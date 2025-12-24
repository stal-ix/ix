{% extends '//die/inline/program.sh' %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block name %}
test
{% endblock %}

{% block sources %}
test.cpp
{% endblock %}
