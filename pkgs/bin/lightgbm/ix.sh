{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/microsoft/LightGBM
{% endblock %}

{% block git_branch %}
v4.0.0
{% endblock %}

{% block git_sha %}
640e005e4c2e335631bbe408ff4322fa2bcbdcc3fb0b27d33b6125d1d6166dae
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
