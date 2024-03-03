{% extends '//die/c/cmake.sh' %}

{% block git_sha %}
abf4ab1e262b97110c8a94ab4d5d29a7c62ef0c66633ed85210ca1a3ea3dad91
{% endblock %}

{% block git_repo %}
https://github.com/luvit/luv
{% endblock %}

{% block git_branch %}
1.48.0-2
{% endblock %}

{% block cmake_flags %}
BUILD_MODULE=OFF
BUILD_STATIC_LIBS=ON
WITH_SHARED_LIBUV=ON
LUA_BUILD_TYPE=System
{% endblock %}

{% block lib_deps %}
lib/c
lib/uv
lib/lua
{% endblock %}
