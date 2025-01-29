{% extends '//die/inline/program.sh' %}

{% block bld_libs %}
lib/c
lib/c++
lib/xxhash
{% endblock %}

{% block name %}
runsvdir
{% endblock %}

{% block cxx_flags %}
-std=c++20
{% endblock %}

{% block sources %}
m.cpp
{% endblock %}
