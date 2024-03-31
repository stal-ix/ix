{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/WebAssembly/wabt
{% endblock %}

{% block git_branch %}
1.0.33
{% endblock %}

{% block git_sha %}
4d90bf8167ae0ede7ae6c0681e1e533d2cfbced3396bd41904670a50af59a5ee
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

{% block git_version %}
v3
{% endblock %}
