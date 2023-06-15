{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/protocolbuffers/protobuf/archive/refs/tags/v23.3.tar.gz
sha:4e176116949be52b0408dfd24f8925d1eb674a781ae242a75296b17a1c721395
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
