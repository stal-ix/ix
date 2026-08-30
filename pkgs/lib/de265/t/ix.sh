{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libde265
{% endblock %}

{% block version %}
1.1.1
{% endblock %}

{% block fetch %}
https://github.com/strukturag/libde265/archive/refs/tags/v{{self.version().strip()}}.tar.gz
5b4fac677018e6074196e8f9889f3e4a5310e46afbf22a893f620d4e24d3510e
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block bld_libs %}
lib/shim/fake(lib_name=stdc++)
{% endblock %}

{% block cmake_flags %}
{% if not x86_64 %}
DISABLE_SSE=ON
{% endif %}
{% endblock %}
