{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/microsoft/LightGBM
{% endblock %}

{% block git_branch %}
v4.6.0
{% endblock %}

{% block git_sha %}
8a0308a2a0624ff4997eb5968a5767c31134c5346177b064e97e35b6a94a40dd
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
