{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
GSL
{% endblock %}

{% block version %}
4.0.0
{% endblock %}

{% block fetch %}
https://github.com/microsoft/GSL/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:f0e32cb10654fea91ad56bde89170d78cfbf4363ee0b01d8f097de2ba49f6ce9
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block cmake_flags %}
GSL_TEST=OFF
GSL_INSTALL=ON
{% endblock %}
