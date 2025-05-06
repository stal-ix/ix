{% extends '//die/c/make.sh' %}

# check bin/neo/vim

{% block pkg_name %}
tree-sitter-vimdoc
{% endblock %}

{% block version %}
3.0.1
{% endblock %}

{% block fetch %}
https://github.com/neovim/tree-sitter-vimdoc/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:76b65e5bee9ff78eb21256619b1995aac4d80f252c19e1c710a4839481ded09e
{% endblock %}

{% block bld_libs %}
lib/tree/sitter
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
