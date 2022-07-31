{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/ngtcp2/nghttp3/archive/refs/tags/v0.6.0.tar.gz
sha:3cd5fa107541a2dd11b87a84f251a98fae4c7b67df9d78be7343e4adce540b7f
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/c++
{% endblock %}

{% block cmake_flags %}
ENABLE_LIB_ONLY=OFF
ENABLE_STATIC_LIB=OFF
{% endblock %}
