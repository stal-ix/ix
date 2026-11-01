{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
simdjson
{% endblock %}

{% block version %}
5.1.1
{% endblock %}

{% block fetch %}
https://github.com/simdjson/simdjson/archive/refs/tags/v{{self.version().strip()}}.tar.gz
d669fa399613c20bbf7705f057a72984331b223cd5e8d20666ef063dbf97f3e6
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
