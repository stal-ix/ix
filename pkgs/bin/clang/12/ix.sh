{% extends '//bin/clang/t/ix.sh' %}

{% block fetch %}
https://github.com/llvm/llvm-project/archive/refs/tags/llvmorg-12.0.1.tar.gz
b23c6287824a30f5a58315f402b1ead3
{% endblock %}

{% block env %}
{{super()}}
export CLANG_VERSION=12.0.1
{% endblock %}
