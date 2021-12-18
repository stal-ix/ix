{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
https://github.com/luvit/luv/archive/refs/tags/1.42.0-1.tar.gz
167eef7ce7698779d88769a625365c7e
{% endblock %}

{% block cmake_flags %}
BUILD_MODULE=OFF
BUILD_STATIC_LIBS=ON
WITH_SHARED_LIBUV=ON
WITH_LUA_ENGINE=Lua
LUA_BUILD_TYPE=System
{% endblock %}

{% block lib_deps %}
lib/c/mix.sh
lib/uv/mix.sh
lib/lua/mix.sh
{% endblock %}
