{% extends '//bin/clang/t/t/ix.sh' %}

{% block fetch %}
{% include '//lib/llvm/16/ver.sh' %}
{% endblock %}

{% block llvm_targets %}
llvm-config
llvm-tblgen
clang-tblgen
{% endblock %}

{% block env %}
export CLANG_TABLEGEN=${out}/bin/clang-tblgen
export LLVM_TABLEGEN=${out}/bin/llvm-tblgen
export CMFLAGS="-DLLVM_CONFIG_PATH=${out}/bin/llvm-config -DCLANG_TABLEGEN=\${CLANG_TABLEGEN} \${CMFLAGS}"
{% endblock %}
