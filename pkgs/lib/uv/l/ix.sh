{% extends '//die/c/cmake.sh' %}

# check bin/neo/vim

{% block pkg_name %}
luv
{% endblock %}

{% block version %}
1.53.0-0
{% endblock %}

{% block git_sha %}
7025a7291ee37ec658cfeba0302027eaf272d4be3597198977ec53adba516e5c
{% endblock %}

{% block git_version %}
v4
{% endblock %}

{% block git_repo %}
https://github.com/luvit/luv
{% endblock %}

{% block git_branch %}
{{self.version().strip()[:-2]}}-{{self.version().strip()[-1:]}}
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
