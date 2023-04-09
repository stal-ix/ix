{% extends '//die/inline/program.sh' %}

{% block bld_libs %}
lib/jthread/polyfill
{% endblock %}

{% block name %}
test
{% endblock %}

{% block sources %}
main.cpp
{% endblock %}
