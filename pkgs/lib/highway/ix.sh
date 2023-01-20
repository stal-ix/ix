{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/google/highway/archive/refs/tags/1.0.3.tar.gz
sha:566fc77315878473d9a6bd815f7de78c73734acdcb745c3dde8579560ac5440e
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block cmake_flags %}
HWY_ENABLE_EXAMPLES=OFF
{% endblock %}
