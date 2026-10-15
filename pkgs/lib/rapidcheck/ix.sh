{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/emil-e/rapidcheck
{% endblock %}

{% block git_commit %}
a5724ea5b0b00147109b0605c377f1e54c353ba2
{% endblock %}

{% block git_sha %}
3be0ac993b0c5ccb8ea9e61de40b2b864ba2094339c965fe6ee8d48b5f432bed
{% endblock %}

{% block git_version %}
v4
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/google/test
{% endblock %}

{% block cmake_flags %}
RC_ENABLE_GTEST=ON
{% endblock %}
