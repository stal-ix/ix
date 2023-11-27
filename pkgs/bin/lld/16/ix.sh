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

{% block cmake_flags %}
{{super()}}
LLVM_INCLUDE_BENCHMARKS=OFF
LLVM_INCLUDE_TESTS=OFF
{% endblock %}
