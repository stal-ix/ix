{% extends '//bin/clang/18/ix.sh' %}

{% block cmake_flags %}
{{super()}}
LLVM_ENABLE_PROJECTS="clang;clang-tools-extra"
{% endblock %}

{% block ninja_build_targets %}
clangd
{% endblock %}

{% block postinstall %}
:
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/obj/bin/clangd ${out}/bin/
{% endblock %}
