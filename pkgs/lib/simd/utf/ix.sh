{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
simdutf
{% endblock %}

{% block version %}
9.3.3
{% endblock %}

{% block fetch %}
https://github.com/simdutf/simdutf/archive/refs/tags/v{{self.version().strip()}}.tar.gz
441e374e8629bd8469f6d5cde9f0fa17ef3ad158aeb077791606d8aa73b565ef
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
