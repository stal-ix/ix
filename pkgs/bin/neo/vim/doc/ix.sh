{% extends '//die/c/make.sh' %}

{% block pkg_name %}
tree-sitter-vimdoc
{% endblock %}

{% block version %}
3.0.0
{% endblock %}

{% block fetch %}
https://github.com/neovim/tree-sitter-vimdoc/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:a639bf92bf57bfa1cdc90ca16af27bfaf26a9779064776dd4be34c1ef1453f6c
{% endblock %}

{% block bld_libs %}
lib/tree/sitter
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
