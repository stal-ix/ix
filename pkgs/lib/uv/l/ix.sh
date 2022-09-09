{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/luvit/luv/archive/refs/tags/1.44.2-1.tar.gz
sha:f8c69908e17ec8ab370253d1508e23deaecfc0c4752d2efb77e427e579501104
https://github.com/keplerproject/lua-compat-5.3/archive/refs/tags/v0.9.tar.gz
sha:ad05540d2d96a48725bb79a1def35cf6652a4e2ec26376e2617c8ce2baa6f416
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
