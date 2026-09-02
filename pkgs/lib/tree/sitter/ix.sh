{% extends '//die/c/make.sh' %}

# check bin/neo/vim

{% block pkg_name %}
tree-sitter
{% endblock %}

{% block version %}
0.27.0
{% endblock %}

{% block fetch %}
https://github.com/tree-sitter/tree-sitter/archive/refs/tags/v{{self.version().strip()}}.tar.gz
d35c96e68736bd9569d2757c3cc71052485f33082c3825f1aed9d0e86013a159
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
