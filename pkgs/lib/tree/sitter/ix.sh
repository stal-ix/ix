{% extends '//die/c/make.sh' %}

{% block pkg_name %}
tree-sitter
{% endblock %}

{% block version %}
0.25.6
{% endblock %}

{% block fetch %}
https://github.com/tree-sitter/tree-sitter/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:ac6ed919c6d849e8553e246d5cd3fa22661f6c7b6497299264af433f3629957c
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
