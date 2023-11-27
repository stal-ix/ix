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
export CMFLAGS="-DLLVM_CONFIG_PATH=${out}/bin/llvm-config -DCLANG_TABLEGEN=${out}/bin/clang-tblgen -DLLVM_TABLEGEN=${out}/bin/llvm-tblgen \${CMFLAGS}"
{% endblock %}
