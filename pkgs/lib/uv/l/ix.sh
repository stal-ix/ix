{% extends '//die/c/cmake.sh' %}

# check bin/neo/vim

{% block pkg_name %}
luv
{% endblock %}

{% block version %}
1.51.0.1
{% endblock %}

{% block git_sha %}
4424dea07bad49bedc62a9f6fd0bfb92275a017c7fe39d352b5b34a3fa364a98
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
