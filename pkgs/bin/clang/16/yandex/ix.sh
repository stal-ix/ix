{% extends '//bin/clang/16/ix.sh' %}

{% block llvm_targets %}
{{super()}}
clang-format
clang-rename
llvm-cov
llvm-profdata
llvm-rc
sancov
{% endblock %}
