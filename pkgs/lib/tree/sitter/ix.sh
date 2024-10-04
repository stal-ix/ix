{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/tree-sitter/tree-sitter/archive/refs/tags/v0.24.0.tar.gz
sha:1f2d1468a959993f67c8bd08d3cc26ef344a9ba52f8c7063e3fa50167516c53f
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
