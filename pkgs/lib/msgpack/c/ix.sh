{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/msgpack/msgpack-c/archive/refs/tags/c-6.0.1.tar.gz
sha:58d5fe49d0ee2b374d60a61aabf8028b2c92004e6f11bff04e74b639fc8ad541
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
MSGPACK_BUILD_TESTS=OFF
MSGPACK_BUILD_EXAMPLES=OFF
{% endblock %}
