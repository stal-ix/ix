{% extends '//die/c/cmake.sh' %}

{% block git_sha %}
c838c72ac451f8fa32e56478cc71e0c3a127de47fd9d8dba55b270ae852053d1
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
