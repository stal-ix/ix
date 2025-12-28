{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
double-conversion
{% endblock %}

{% block version %}
3.4.0
{% endblock %}

{% block fetch %}
https://github.com/google/double-conversion/archive/refs/tags/v{{self.version().strip()}}.tar.gz
42fd4d980ea86426e457b24bdfa835a6f5ad9517ddb01cdb42b99ab9c8dd5dc9
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
