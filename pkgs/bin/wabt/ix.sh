{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
wabt
{% endblock %}

{% block version %}
1.0.41
{% endblock %}

{% block git_repo %}
https://github.com/WebAssembly/wabt
{% endblock %}

{% block git_branch %}
{{self.version().strip()}}
{% endblock %}

{% block git_sha %}
f8ab01ca0d0c73bbaff547080843435a9e9aa04b9541a7836fa43e0e961d765c
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
