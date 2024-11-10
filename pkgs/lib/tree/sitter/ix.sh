{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/tree-sitter/tree-sitter/archive/refs/tags/v0.24.4.tar.gz
sha:d704832a6bfaac8b3cbca3b5d773cad613183ba8c04166638af2c6e5dfb9e2d2
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
