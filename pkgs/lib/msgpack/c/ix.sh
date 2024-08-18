{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/msgpack/msgpack-c/archive/refs/tags/c-6.1.0.tar.gz
sha:c23c4070dbe01f46044bf70c5349f29453d655935b6dc710714c008bca0825a7
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
MSGPACK_BUILD_TESTS=OFF
MSGPACK_BUILD_EXAMPLES=OFF
{% endblock %}
