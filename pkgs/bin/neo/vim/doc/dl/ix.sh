{% extends '//die/dl/lib.sh' %}

{% block lib_deps %}
bin/neo/vim/doc
{% endblock %}

{% block export_libs %}
libtree-sitter-vimdoc.a
{% endblock %}

{% block export_lib %}
tree-sitter-vimdoc
{% endblock %}
