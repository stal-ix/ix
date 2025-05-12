{% extends '//die/c/cmake.sh' %}

# check bin/neo/vim

{% block pkg_name %}
luv
{% endblock %}

{% block version %}
1.51.0.0
{% endblock %}

{% block git_sha %}
9bbf6bcaafd4bbb77e0c4b6792dee3575445d0ca2e604cd11655c7e26baec599
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
