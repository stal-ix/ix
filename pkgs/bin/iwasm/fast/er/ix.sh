{% extends '//bin/iwasm/fast/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/llvm/19
{% endblock %}

{% block cmake_flags %}
{{super()}}
LLVM_DIR=${LLVM_DIR}
WAMR_BUILD_JIT=1
{% endblock %}
