{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/tree-sitter/tree-sitter/archive/refs/tags/v0.23.0.tar.gz
sha:6403b361b0014999e96f61b9c84d6950d42f0c7d6e806be79382e0232e48a11b
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
