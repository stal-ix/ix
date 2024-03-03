{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/nfs-ganesha/nfs-ganesha
{% endblock %}

{% block git_branch %}
V5.7
{% endblock %}

{% block git_sha %}
f9c2e5fd58dca78cfea4368ee705ffd526b478428e5a3be4ed521f7f9c606772
{% endblock %}

{% block lib_deps %}
lib/c
lib/nsl
lib/urcu
lib/kernel
lib/shim/cdefs
{% endblock %}

{% block bld_tool %}
bld/flex
bld/bison
{% endblock %}

{% block step_unpack %}
{{super()}}
cd src
{% endblock %}

{% block cmake_flags %}
USE_GSS=OFF
{% endblock %}
