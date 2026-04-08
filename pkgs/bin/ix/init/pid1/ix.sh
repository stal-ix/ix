{% extends '//die/inline/program.sh' %}

{% block bld_libs %}
lib/c
lib/std
{% endblock %}

{% block name %}
pid1
{% endblock %}

{% block cxx_flags %}
-std=c++26
{% endblock %}

{% block sources %}
m.cpp
{% endblock %}
