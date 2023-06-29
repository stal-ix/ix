{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/emil-e/rapidcheck
{% endblock %}

{% block git_commit %}
a5724ea5b0b00147109b0605c377f1e54c353ba2
{% endblock %}

{% block git_branch %}
master
{% endblock %}

{% block git_sha %}
e567eba9ca32921a84c844f5132b23ac1e3b9c5cb5ba043b1c258d59e653f24b
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/google/test
{% endblock %}

{% block cmake_flags %}
RC_ENABLE_GTEST=ON
{% endblock %}
