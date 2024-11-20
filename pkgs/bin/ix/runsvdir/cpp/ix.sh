{% extends '//die/inline/program.sh' %}

{% block bld_libs %}
lib/c
lib/c++
lib/xxhash
{% endblock %}

{% block name %}
runsvdir
{% endblock %}

{% block sources %}
m.cpp
{% endblock %}
