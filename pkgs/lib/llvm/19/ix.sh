{% extends '//lib/llvm/16/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/kernel
{% endblock %}

{% block bld_tool %}
{{super()}}
lib/llvm/19/tblgen
{% endblock %}

{% block fetch %}
{% include 'ver.sh' %}
{% endblock %}

{% block cmake_flags %}
{{super()}}
LLVM_ENABLE_PROJECTS="lld;clang"
{% endblock %}

{% block postinstall %}
{{super()}}
mkdir ${out}/bin
echo > ${out}/bin/lld
{% endblock %}

{% block env %}
{{super()}}
export LLVM_DIR=${out}
export LLVM_MAIN_VERSION=19
export LLVM_FULL_VERSION=19.1
{% endblock %}
