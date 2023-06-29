{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/emil-e/rapidcheck
{% endblock %}

{% block git_commit %}
a5724ea5b0b00147109b0605c377f1e54c353ba2
{% endblock %}

{% block git_sha %}
c946ed9e6fde25c3fc5763ad2fc4f4fd438070a32322fc1b14ab80e13c3b2697
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/google/test
{% endblock %}

{% block cmake_flags %}
RC_ENABLE_GTEST=ON
{% endblock %}
