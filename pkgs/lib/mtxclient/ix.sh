{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/Nheko-Reborn/mtxclient
{% endblock %}

{% block git_commit %}
901ec5e35f76ebdff732ea28953b772ec7024df3
{% endblock %}

{% block git_sha %}
cab195dc2fb83593b37356d244ff0a101f2e821377277330176a26ba767a880a
{% endblock %}

{% block git_version %}
v3
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
