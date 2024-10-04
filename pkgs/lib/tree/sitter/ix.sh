{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/tree-sitter/tree-sitter/archive/refs/tags/v0.24.1.tar.gz
sha:7adb5bb3b3c2c4f4fdc980a9a13df8fbf3526a82b5c37dd9cf2ed29de56a4683
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
