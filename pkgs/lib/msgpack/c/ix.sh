{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
msgpack-c
{% endblock %}

{% block version %}
7.0.2
{% endblock %}

{% block fetch %}
https://github.com/msgpack/msgpack-c/archive/refs/tags/c-{{self.version().strip()}}.tar.gz
f720af974b72cda874c2c347d4bafef5385c4e7942a27b3c87d6fa482412d08c
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
MSGPACK_BUILD_TESTS=OFF
MSGPACK_BUILD_EXAMPLES=OFF
{% endblock %}
