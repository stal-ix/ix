{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
wabt
{% endblock %}

{% block version %}
1.0.39
{% endblock %}

{% block git_repo %}
https://github.com/WebAssembly/wabt
{% endblock %}

{% block git_branch %}
{{self.version().strip()}}
{% endblock %}

{% block git_sha %}
957295b7dd5a31573a5116f76cd551e26853855897067e6643adc0cdf2b57258
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
