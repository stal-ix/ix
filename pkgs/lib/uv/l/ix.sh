{% extends '//die/c/cmake.sh' %}

# check bin/neo/vim

{% block pkg_name %}
luv
{% endblock %}

{% block version %}
1.53.0.1
{% endblock %}

{% block git_sha %}
d020914087bf61a40324b8a781006f236fbca6af96a2082bd485c815b971db6b
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
