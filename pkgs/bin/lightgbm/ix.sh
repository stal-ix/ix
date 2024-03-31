{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/microsoft/LightGBM
{% endblock %}

{% block git_branch %}
v4.3.0
{% endblock %}

{% block git_sha %}
6a5375cc209672fa32c1bdd2e2a39a8c7ad0b6c00ad9e8fb3ed4fffa0a9eb448
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/fmt
lib/omp
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
