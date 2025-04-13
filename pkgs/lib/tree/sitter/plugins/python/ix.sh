{% extends '//die/c/make.sh' %}

{% block pkg_name %}
tree-sitter-python
{% endblock %}

{% block version %}
0.21.0
{% endblock %}

{% block fetch %}
https://github.com/tree-sitter/tree-sitter-python/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:720304a603271fa89e4430a14d6a81a023d6d7d1171b1533e49c0ab44f1e1c13
{% endblock %}

{% block bld_libs %}
lib/tree/sitter
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
