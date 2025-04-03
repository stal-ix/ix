{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/WebAssembly/wabt
{% endblock %}

{% block git_branch %}
1.0.37
{% endblock %}

{% block git_sha %}
dd29693af8ac0d879af210f78165ab24a7866fcbc59655ba70d6170652acb126
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/openssl
{% endblock %}

{% block bld_tool %}
bld/python
{% endblock %}

{% block cmake_flags %}
BUILD_TESTS=OFF
USE_SYSTEM_GTEST=ON
{% endblock %}
