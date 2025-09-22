{% extends '//die/c/make.sh' %}

{% block pkg_name %}
tree-sitter
{% endblock %}

{% block version %}
0.26.0
{% endblock %}

{% block fetch %}
https://github.com/tree-sitter/tree-sitter/archive/refs/tags/v{{self.version().strip()}}.tar.gz
ed464a90b7d73cdcf7acecf132186b905998f80f216be262f101ffc49d6459d7
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
