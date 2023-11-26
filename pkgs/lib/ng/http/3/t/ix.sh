{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/ngtcp2/nghttp3/archive/refs/tags/v1.1.0.tar.gz
sha:b3ffb23a90442a0eafe8bfbefbc8b4ffb5179d68a7c0b8a416a34cf04b28d7c5
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/c++
{% endblock %}

{% block cmake_flags %}
ENABLE_STATIC_LIB=OFF
{% endblock %}
