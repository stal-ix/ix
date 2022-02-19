{% extends '//bin/clang/t/mix.sh' %}

{% block fetch %}
{% include '//lib/llvm/14/ver.sh' %}
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
