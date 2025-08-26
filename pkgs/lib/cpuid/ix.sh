{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libcpuid
{% endblock %}

{% block version %}
0.8.1
{% endblock %}

{% block fetch %}
https://github.com/anrieff/libcpuid/archive/refs/tags/v{{self.version().strip()}}.tar.gz
81f2f40da5d66b8220476e116cb40bca4e6a62c0d22bdeeb8e3856cf14607007
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
ENABLE_DOCS=OFF
{% endblock %}
