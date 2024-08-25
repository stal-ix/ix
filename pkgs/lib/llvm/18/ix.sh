{% extends '//lib/llvm/16/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/kernel
{% endblock %}

{% block bld_tool %}
{{super()}}
lib/llvm/18/tblgen
{% endblock %}

{% block fetch %}
{% include 'ver.sh' %}
{% endblock %}

{% block ninja_build_targets %}
lib/Target/AMDGPU/AMDGPUGenAsmMatcher.inc
{% endblock %}

{% block cmake_flags %}
{{super()}}
LLVM_ENABLE_PROJECTS="lld;clang"
{% endblock %}

{% block env %}
{{super()}}
export LLVM_DIR=${out}
export LLVM_MAIN_VERSION=18
export LLVM_FULL_VERSION=18.1.8
{% endblock %}
