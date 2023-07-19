{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/google/highway/archive/refs/tags/1.0.5.tar.gz
sha:99b7dad98b8fa088673b720151458fae698ae5df9154016e39de4afdc23bb927
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block cmake_flags %}
HWY_ENABLE_EXAMPLES=OFF
{% endblock %}
