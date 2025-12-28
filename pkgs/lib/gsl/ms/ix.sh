{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
GSL
{% endblock %}

{% block version %}
4.2.1
{% endblock %}

{% block fetch %}
https://github.com/microsoft/GSL/archive/refs/tags/v{{self.version().strip()}}.tar.gz
d959f1cb8bbb9c94f033ae5db60eaf5f416be1baa744493c32585adca066fe1f
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block cmake_flags %}
GSL_TEST=OFF
GSL_INSTALL=ON
{% endblock %}
