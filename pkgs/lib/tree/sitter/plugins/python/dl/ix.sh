{% extends '//die/dl/lib.sh' %}

{% block lib_deps %}
lib/tree/sitter/plugins/python
{% endblock %}

{% block export_libs %}
libtree-sitter-python.a
{% endblock %}

{% block export_lib %}
tree-sitter-python
{% endblock %}
