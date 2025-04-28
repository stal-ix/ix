{% extends '//die/c/make.sh' %}

{% block pkg_name %}
tree-sitter-python
{% endblock %}

{% block version %}
0.23.6
{% endblock %}

{% block fetch %}
https://github.com/tree-sitter/tree-sitter-python/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:630a0f45eccd9b69a66a07bf47d1568e96a9c855a2f30e0921c8af7121e8af96
{% endblock %}

{% block bld_libs %}
lib/tree/sitter
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
