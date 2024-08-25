{% extends '//lib/llvm/16/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/kernel
{% endblock %}

{% block bld_tool %}
lib/llvm/18/tblgen
{{super()}}
{% endblock %}

{% block fetch %}
{% include 'ver.sh' %}
{% endblock %}

{% block ninja_build_targets %}
lib/Target/AMDGPU/AMDGPUGenAsmMatcher.inc
{% endblock %}
