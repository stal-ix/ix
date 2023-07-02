{% extends '//die/c/cmake.sh' %}

{% block git_sha %}
5f209dbba07cd225c30ea53e101572a32990ecfe2d75cc98025f2b25e66c5686
{% endblock %}

{% block git_repo %}
https://github.com/luvit/luv
{% endblock %}

{% block git_branch %}
1.45.0-0
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
