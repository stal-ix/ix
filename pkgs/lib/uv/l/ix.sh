{% extends '//die/c/cmake.sh' %}

# check bin/neo/vim

{% block pkg_name %}
luv
{% endblock %}

{% block version %}
1.50.0.1
{% endblock %}

{% block git_sha %}
b2c6c6ae9c990784f7755966c5261fde544c555b0a948c27b4e71a09700466a2
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
