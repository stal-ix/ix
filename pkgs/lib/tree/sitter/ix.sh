{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/tree-sitter/tree-sitter/archive/refs/tags/v0.20.8.tar.gz
sha:6181ede0b7470bfca37e293e7d5dc1d16469b9485d13f13a605baec4a8b1f791
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
