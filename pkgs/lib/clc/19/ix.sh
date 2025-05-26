{% extends '//lib/clc/t/ix.sh' %}

{% block fetch %}
{% include '//lib/llvm/19/ver.sh' %}
{% endblock %}

{% block lib_deps %}
{{super()}}
lib/llvm/19
{% endblock %}

{% block bld_tool %}
{{super()}}
bin/llvm/spirv/19
{% endblock %}
