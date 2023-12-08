{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/Nheko-Reborn/mtxclient/archive/refs/tags/v0.9.2.tar.gz
sha:f55827fdba226c6fc409cf000c72b13cc6d069ec1300283a7239aa19c90c5f56
{% endblock %}

{% block lib_deps %}
lib/c
lib/re2
lib/c++
lib/olm
lib/curl
lib/event
lib/coeurl
lib/spdlog
lib/openssl
lib/json/nlohmann
{% endblock %}

{% block cmake_flags %}
BUILD_LIB_TESTS=OFF
BUILD_LIB_EXAMPLES=OFF
{% endblock %}
