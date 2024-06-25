{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/msgpack/msgpack-c/archive/refs/tags/c-6.0.2.tar.gz
sha:f5b031d7b2f6639936826baeea4d3080e7db5db76838c7230089ec3d1f97e6a2
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
MSGPACK_BUILD_TESTS=OFF
MSGPACK_BUILD_EXAMPLES=OFF
{% endblock %}
