{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
https://github.com/luvit/luv/archive/refs/tags/1.42.0-1.tar.gz
167eef7ce7698779d88769a625365c7e

https://github.com/keplerproject/lua-compat-5.3/archive/refs/tags/v0.9.tar.gz
7c0530123479804e40971b069ea6b0da
{% endblock %}

{% block unpack %}
mkdir src; cd src
extract ${src}/1*
cd *
cd deps; rm -r lua-compat-5.3
extract ${src}/v*;
mv lua-compat-5.3* lua-compat-5.3
cd ..
{% endblock %}

{% block cmake_flags %}
BUILD_MODULE=OFF
BUILD_STATIC_LIBS=ON
WITH_SHARED_LIBUV=ON
LUA_BUILD_TYPE=System
{% endblock %}

{% block lib_deps %}
lib/c/mix.sh
lib/uv/mix.sh
lib/lua/mix.sh
{% endblock %}
