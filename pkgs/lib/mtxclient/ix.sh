{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/Nheko-Reborn/mtxclient
{% endblock %}

{% block git_commit %}
901ec5e35f76ebdff732ea28953b772ec7024df3
{% endblock %}

{% block git_sha %}
e5f5f1eb17cd7a088787f73e653b79d5302526ae5399cab69cb614a8c7acf6ae
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
