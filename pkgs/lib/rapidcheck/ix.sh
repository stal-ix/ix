{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/emil-e/rapidcheck
{% endblock %}

{% block git_commit %}
a5724ea5b0b00147109b0605c377f1e54c353ba2
{% endblock %}

{% block git_sha %}
35e08d63b0496d724a80102cf6ea917eff135de327bfaaaebca24f392a2a074b
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/google/test
{% endblock %}

{% block cmake_flags %}
RC_ENABLE_GTEST=ON
{% endblock %}

{% block git_version %}
v3
{% endblock %}
