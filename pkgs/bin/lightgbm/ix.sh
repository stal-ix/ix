{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/microsoft/LightGBM
{% endblock %}

{% block git_branch %}
v4.0.0
{% endblock %}

{% block git_sha %}
83a5105d066bbc21a0c5bfff2448ee33aac8217c50067608e2981768d9b77495
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
