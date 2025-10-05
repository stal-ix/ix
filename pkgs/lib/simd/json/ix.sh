{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
simdjson
{% endblock %}

{% block version %}
4.0.7
{% endblock %}

{% block fetch %}
https://github.com/simdjson/simdjson/archive/refs/tags/v{{self.version().strip()}}.tar.gz
d2d15490605858d3dd42e90d25e0fde31c53446b7d3cde9ef334449236927916
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
