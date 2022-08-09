{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/google/highway/archive/refs/tags/1.0.0.tar.gz
sha:ab4f5f864932268356f9f6aa86f612fa4430a7db3c8de0391076750197e876b8
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block cmake_flags %}
HWY_ENABLE_EXAMPLES=OFF
{% endblock %}
