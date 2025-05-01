{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libconfig
{% endblock %}

{% block version %}
1.8
{% endblock %}

{% block fetch %}
https://github.com/hyperrealm/libconfig/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:22e13253e652ec583ba0dd5b474bd9c7bd85dc724f2deb0d76a6299c421358ef
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
BUILD_EXAMPLES=OFF
BUILD_TESTS=OFF
{% endblock %}
