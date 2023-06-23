{% extends '//bin/iwasm/fast/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/llvm/15
{% endblock %}

{% block cmake_flags %}
{{super()}}
LLVM_DIR=/xxx
WAMR_BUILD_JIT=1
{% endblock %}
