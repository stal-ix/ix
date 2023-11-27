{% extends '//bin/clang/t/t/ix.sh' %}

{% block fetch %}
{% include '//lib/llvm/16/ver.sh' %}
{% endblock %}

{% block llvm_targets %}
llvm-config
llvm-tblgen
clang-tblgen
{% endblock %}

{% block env1 %}
export CMFLAGS="-DLLVM_NATIVE_TOOL_DIR=${out}/bin \${CMFLAGS}"
{% endblock %}
