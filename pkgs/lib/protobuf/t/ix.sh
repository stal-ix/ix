{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/protocolbuffers/protobuf/archive/refs/tags/v24.4.tar.gz
sha:616bb3536ac1fff3fb1a141450fa28b875e985712170ea7f1bfe5e5fc41e2cd8
{% endblock %}

{% block lib_deps %}
lib/z
lib/c
lib/c++
lib/abseil/cpp
{% endblock %}

{% block cmake_flags %}
protobuf_BUILD_TESTS=OFF
protobuf_ABSL_PROVIDER=package
{% endblock %}
