{% extends '//die/c/make.sh' %}

{% block pkg_name %}
tree-sitter
{% endblock %}

{% block version %}
0.25.7
{% endblock %}

{% block fetch %}
https://github.com/tree-sitter/tree-sitter/archive/refs/tags/v{{self.version().strip()}}.tar.gz
ef9d1afe8e81a508c28e529101f28ad38b785daf3acc0a2f707d00e8c4a498a8
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
