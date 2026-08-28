{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
LightGBM
{% endblock %}

{% block version %}
4.7.0
{% endblock %}

{% block git_repo %}
https://github.com/microsoft/LightGBM
{% endblock %}

{% block git_branch %}
v{{self.version().strip()}}
{% endblock %}

{% block git_sha %}
e3a559493109a9e92f0f1181807ee67f09cdc89c2294e6a5d9f755b0d36054e7
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
