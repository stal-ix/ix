{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/microsoft/LightGBM
{% endblock %}

{% block git_branch %}
v4.5.0
{% endblock %}

{% block git_sha %}
b34a4e1d2b953462d345413c8461f6f4885f59a700d1d6f6080facc277cb88dd
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
