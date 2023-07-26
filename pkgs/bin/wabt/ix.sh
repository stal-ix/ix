{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/WebAssembly/wabt
{% endblock %}

{% block git_branch %}
1.0.33
{% endblock %}

{% block git_sha %}
d2125308b1b41496b9365095431ddbb5c9d2def781512748d26c1e9dfb561586
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
