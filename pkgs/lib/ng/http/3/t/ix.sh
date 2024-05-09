{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/ngtcp2/nghttp3/releases/download/v1.3.0/nghttp3-1.3.0.tar.xz
sha:450525981d302f23832b18edd1a62cf58019392ca6402408d0eb1a7f3fd92ecf
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
