{% extends '//die/c/make.sh' %}

{% block version %}
0.25.3
{% endblock %}

{% block fetch %}
https://github.com/tree-sitter/tree-sitter/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:862fac52653bc7bc9d2cd0630483e6bdf3d02bcd23da956ca32663c4798a93e3
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
