{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/WebAssembly/wabt
{% endblock %}

{% block git_branch %}
1.0.36
{% endblock %}

{% block git_sha %}
033791dd556bb85049dc909dfad93146f3a6891ffc3a5c58561d77461d44365e
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
