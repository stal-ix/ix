{% extends '//mix/cmake.sh' %}

{% block fetch %}
https://github.com/OpenVisualCloud/SVT-VP9/archive/refs/tags/v0.3.0.tar.gz
sha:6ee01b81c43816170b18709c6045b6245cecc2953f01cecc9e98f82b49ea4f73
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bin/nasm
{% endblock %}
