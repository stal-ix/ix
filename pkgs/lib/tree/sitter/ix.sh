{% extends '//die/c/make.sh' %}

# check bin/neo/vim

{% block pkg_name %}
tree-sitter
{% endblock %}

{% block version %}
0.25.9
{% endblock %}

{% block fetch %}
https://github.com/tree-sitter/tree-sitter/archive/refs/tags/v{{self.version().strip()}}.tar.gz
024a2478579acebbb8882d7c2c0f0e07fc0aa19a459b48d10469e4abb96cf16e
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
