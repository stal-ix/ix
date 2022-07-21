{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/luvit/luv/archive/refs/tags/1.42.0-1.tar.gz
md5:167eef7ce7698779d88769a625365c7e

https://github.com/keplerproject/lua-compat-5.3/archive/refs/tags/v0.9.tar.gz
md5:7c0530123479804e40971b069ea6b0da
{% endblock %}

{% block unpack %}
mkdir src; cd src; extract1 ${src}/1*
(cd deps/lua-compat-5.3; extract1 ${src}/v*)
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
