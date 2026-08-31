{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
GSL
{% endblock %}

{% block version %}
5.0.0
{% endblock %}

{% block fetch %}
https://github.com/microsoft/GSL/archive/refs/tags/v{{self.version().strip()}}.tar.gz
e646da6ac00a885cfae33dc935e52bb42bd1d05e41b8437cbc25ca3d74930f35
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block cmake_flags %}
GSL_TEST=OFF
GSL_INSTALL=ON
{% endblock %}
