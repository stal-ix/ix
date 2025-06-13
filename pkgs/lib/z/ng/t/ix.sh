{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
zlib-ng
{% endblock %}

{% block version %}
2.2.4
{% endblock %}

{% block fetch %}
https://github.com/zlib-ng/zlib-ng/archive/refs/tags/{{self.version().strip()}}.tar.gz
a73343c3093e5cdc50d9377997c3815b878fd110bf6511c2c7759f2afb90f5a3
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
ZLIB_ENABLE_TESTS=OFF
{% endblock %}
