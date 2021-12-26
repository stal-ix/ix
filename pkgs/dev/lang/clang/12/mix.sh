{% extends '//dev/lang/clang/t/mix.sh' %}

{% block fetch %}
https://github.com/llvm/llvm-project/archive/refs/tags/llvmorg-12.0.1.tar.gz
b23c6287824a30f5a58315f402b1ead3
{% endblock %}

{% block env %}
{{super()}}
export CLANG_VERSION=12.0.1
{% endblock %}

{% block install %}
{{super()}}

mkdir ${out}/share
mv ${out}/lib/clang/12*/include ${out}/share/
rm -rf ${out}/libexec

cd ${out}/bin

ln -s llvm-ar llvm-ranlib
{% endblock %}
