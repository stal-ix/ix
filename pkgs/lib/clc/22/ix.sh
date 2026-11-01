{% extends '//lib/clc/t/ix.sh' %}

{% block fetch %}
{% include '//lib/llvm/22/ver.sh' %}
{% endblock %}

{% block lib_deps %}
{{super()}}
lib/llvm/22
{% endblock %}

{% block bld_tool %}
{{super()}}
bin/llvm/spirv/22
{% endblock %}
