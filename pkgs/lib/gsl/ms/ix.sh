{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
GSL
{% endblock %}

{% block version %}
5.0.1
{% endblock %}

{% block fetch %}
https://github.com/microsoft/GSL/archive/refs/tags/v{{self.version().strip()}}.tar.gz
733a87a7eea56db075ee060735ba7616a27c1c55955f264d5473bf9e83294ad0
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block cmake_flags %}
GSL_TEST=OFF
GSL_INSTALL=ON
{% endblock %}
