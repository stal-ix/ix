{% extends '//die/c/cmake.sh' %}

{% block git_sha %}
ad981eebdaffc62a0faec37477c9345a41016b9b3848505a6e7e06df3bcd21e1
{% endblock %}

{% block git_repo %}
https://github.com/luvit/luv
{% endblock %}

{% block git_branch %}
1.44.2-1
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
