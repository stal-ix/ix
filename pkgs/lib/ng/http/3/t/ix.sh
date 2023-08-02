{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/ngtcp2/nghttp3/archive/refs/tags/v0.14.0.tar.gz
sha:720a7ff1e83597e4c86724aec392f029b24191ee0236c5e43f833ea670c46e2e
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
