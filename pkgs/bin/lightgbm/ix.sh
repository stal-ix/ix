{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/microsoft/LightGBM
{% endblock %}

{% block git_branch %}
v4.4.0
{% endblock %}

{% block git_sha %}
56df5d1c08c7cebd2fd6e5cc70e20aa85053083b7c08604cef52f99b0afb301b
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
