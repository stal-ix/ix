{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/microsoft/LightGBM
{% endblock %}

{% block git_branch %}
v4.1.0
{% endblock %}

{% block git_sha %}
c9ee987bebbeefada60fb08a15cacb806c2d535f9bff1f178c7018f39ccb6a2e
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/fmt
{% endblock %}

{% block cmake_flags %}
USE_OPENMP=OFF
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
