{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libcpuid
{% endblock %}

{% block version %}
0.8.0
{% endblock %}

{% block fetch %}
https://github.com/anrieff/libcpuid/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:a5fe37d79bda121cbdf385ae3f6fa621da6a3102aa609400a718a4b8b82ed8aa
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
ENABLE_DOCS=OFF
{% endblock %}
