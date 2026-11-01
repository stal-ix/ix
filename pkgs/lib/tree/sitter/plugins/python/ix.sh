{% extends '//die/c/make.sh' %}

{% block pkg_name %}
tree-sitter-python
{% endblock %}

{% block version %}
0.25.0
{% endblock %}

{% block fetch %}
https://github.com/tree-sitter/tree-sitter-python/archive/refs/tags/v{{self.version().strip()}}.tar.gz
4609a3665a620e117acf795ff01b9e965880f81745f287a16336f4ca86cf270c
{% endblock %}

{% block bld_libs %}
lib/tree/sitter
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
