{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/WebAssembly/wabt
{% endblock %}

{% block git_branch %}
1.0.33
{% endblock %}

{% block git_sha %}
5cb0179ece0f99d45765df709b0d5d8bcb23f0af4af984b22044e7ea5119123f
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
