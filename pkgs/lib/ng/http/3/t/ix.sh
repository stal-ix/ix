{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/ngtcp2/nghttp3/releases/download/v1.2.0/nghttp3-1.2.0.tar.xz
sha:d2e216bae7bd7362f850922e4237a5caa204853b3594b22adccab4c1e1c1d1aa
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/c++
{% endblock %}

{% block cmake_flags %}
ENABLE_STATIC_LIB=ON
ENABLE_SHARED_LIB=OFF
{% endblock %}
