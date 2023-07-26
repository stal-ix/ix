{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/emil-e/rapidcheck
{% endblock %}

{% block git_commit %}
a5724ea5b0b00147109b0605c377f1e54c353ba2
{% endblock %}

{% block git_sha %}
18f526731823d5a87dcc25d38f0d5cb3248abe026069cbc5ef73a2558fee0d36
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/google/test
{% endblock %}

{% block cmake_flags %}
RC_ENABLE_GTEST=ON
{% endblock %}
