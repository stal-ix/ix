{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/protocolbuffers/protobuf/archive/refs/tags/v24.2.tar.gz
sha:39b52572da90ad54c883a828cb2ca68e5ac918aa75d36c3e55c9c76b94f0a4f7
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
