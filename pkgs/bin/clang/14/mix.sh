{% extends '//bin/clang/t/mix.sh' %}

{% block fetch %}
https://github.com/llvm/llvm-project/archive/refs/tags/llvmorg-14.0.0-rc1.tar.gz
sha:f598fac0347f4b0cd8bf508109c7cb5c62f0c0768cdd7b378d59d6bf60634985
{% endblock %}

{% block std_box %}
bld/python
{{super()}}
{% endblock %}

{% block env %}
{{super()}}
export CLANG_VERSION=14.0.0-rc1
{% endblock %}

{% block install %}
{{super()}}

mkdir ${out}/share
mv ${out}/lib/clang/1*/include ${out}/share/
rm -rf ${out}/libexec
{% endblock %}
