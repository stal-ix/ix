{% extends '//bin/clang/t/t/ix.sh' %}

{% block fetch %}
{% include '//lib/llvm/16/ver.sh' %}
{% endblock %}

{% block bld_libs %}
lib/zstd
{{super()}}
{% endblock %}

{% block bld_tool %}
bin/lld/16/host
{{super()}}
{% endblock %}

{% block llvm_targets %}
lld
{% endblock %}

{% block cmake_trace %}
#--trace
{% endblock %}

{% block setup %}
{{super()}}
export LLVM_TABLEGEN=$(which llvm-tblgen)
export CLANG_TABLEGEN=$(which clang-tblgen)
{% endblock %}

{% block cmake_flags %}
{{super()}}
CLANG_TABLEGEN=${CLANG_TABLEGEN}
LLVM_TABLEGEN=${LLVM_TABLEGEN}
LLVM_USE_HOST_TOOLS=OFF
LLVM_INCLUDE_BENCHMARKS=OFF
LLVM_INCLUDE_TESTS=OFF
{% endblock %}
