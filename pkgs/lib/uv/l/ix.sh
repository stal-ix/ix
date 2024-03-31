{% extends '//die/c/cmake.sh' %}

{% block git_sha %}
591d2be312f7e2c7912b772f172e3b4b71f6f0029b86f667dfcecfe717a647f6
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

{% block git_version %}
v3
{% endblock %}
