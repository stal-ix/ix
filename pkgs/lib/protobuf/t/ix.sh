{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/protocolbuffers/protobuf/archive/refs/tags/v24.0.tar.gz
sha:850357336189c470e429e9bdffca92229d8cd5b7f84aa2f3b4c5fdb80ce8351b
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
