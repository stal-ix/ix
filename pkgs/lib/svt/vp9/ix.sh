{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
SVT-VP9
{% endblock %}

{% block version %}
0.3.0
{% endblock %}

{% block fetch %}
https://github.com/OpenVisualCloud/SVT-VP9/archive/refs/tags/v{{self.version().strip()}}.tar.gz
6ee01b81c43816170b18709c6045b6245cecc2953f01cecc9e98f82b49ea4f73
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/nasm
{% endblock %}
