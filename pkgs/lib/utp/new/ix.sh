{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/transmission/libutp/archive/c95738b1a6644b919e5b64d3ea9736cfc5894e0b.tar.gz
sha:d856fde68828d52eb39df40e15ad5dc4efaa9a51d4121bcbfbe47fed2163d20a
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block cmake_flags %}
LIBUTP_ENABLE_INSTALL=ON
LIBUTP_ENABLE_WERROR=OFF
LIBUTP_BUILD_PROGRAMS=OFF
{% endblock %}
