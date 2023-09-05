{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/ngtcp2/nghttp3/archive/refs/tags/v0.15.0.tar.gz
sha:6a75f5563e58d99e6b98d442111ac677984011c66b8b4f923764712741399027
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
