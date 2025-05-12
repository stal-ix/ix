{% extends '//die/c/make.sh' %}

{% block pkg_name %}
tree-sitter
{% endblock %}

{% block version %}
0.25.4
{% endblock %}

{% block fetch %}
https://github.com/tree-sitter/tree-sitter/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:87eadc505905c70a692917c821958a819903f808f8d244068b1d273a033dc728
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
