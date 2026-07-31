{% extends '//die/inline/program.sh' %}

{% block bld_libs %}
lib/c
lib/c++
lib/molten/vk
{% endblock %}

{% block name %}
test_molten_vk
{% endblock %}

{% block sources %}
main.cpp
{% endblock %}
