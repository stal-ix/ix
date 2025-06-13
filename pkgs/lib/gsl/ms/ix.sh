{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
GSL
{% endblock %}

{% block version %}
4.2.0
{% endblock %}

{% block fetch %}
https://github.com/microsoft/GSL/archive/refs/tags/v{{self.version().strip()}}.tar.gz
2c717545a073649126cb99ebd493fa2ae23120077968795d2c69cbab821e4ac6
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block cmake_flags %}
GSL_TEST=OFF
GSL_INSTALL=ON
{% endblock %}
