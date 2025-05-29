{% extends '//die/c/make.sh' %}

{% block pkg_name %}
tree-sitter
{% endblock %}

{% block version %}
0.25.5
{% endblock %}

{% block fetch %}
https://github.com/tree-sitter/tree-sitter/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:17a72b9dd7525b01d8fabf9ebee0edd3203fe3058ccc73cbc5e2070ccbe26c0d
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
