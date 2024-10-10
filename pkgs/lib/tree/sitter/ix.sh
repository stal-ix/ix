{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/tree-sitter/tree-sitter/archive/refs/tags/v0.24.3.tar.gz
sha:0a8d0cf8e09caba22ed0d8439f7fa1e3d8453800038e43ccad1f34ef29537da1
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
