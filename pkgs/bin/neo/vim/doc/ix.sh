{% extends '//die/c/make.sh' %}

# check bin/neo/vim

{% block pkg_name %}
tree-sitter-vimdoc
{% endblock %}

{% block version %}
4.3.0
{% endblock %}

{% block fetch %}
https://github.com/neovim/tree-sitter-vimdoc/archive/refs/tags/v{{self.version().strip()}}.tar.gz
4c46119abf86fcb29bc66878eb9a37666a936589769bea2b76308cd2119dfaf5
{% endblock %}

{% block bld_libs %}
lib/tree/sitter
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
