{% extends '//die/c/make.sh' %}

# check bin/neo/vim

{% block pkg_name %}
tree-sitter-vimdoc
{% endblock %}

{% block version %}
4.1.0
{% endblock %}

{% block fetch %}
https://github.com/neovim/tree-sitter-vimdoc/archive/refs/tags/v{{self.version().strip()}}.tar.gz
020e8f117f648c8697fca967995c342e92dbd81dab137a115cc7555207fbc84f
{% endblock %}

{% block bld_libs %}
lib/tree/sitter
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
