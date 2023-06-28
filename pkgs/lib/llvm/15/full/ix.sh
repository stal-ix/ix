{% extends '//lib/llvm/15/ix.sh' %}

{% block cmake_flags %}
{{super()}}
LLVM_ENABLE_PROJECTS="lld"
{% endblock %}

{% block postinstall %}
{{super()}}
mkdir ${out}/bin
echo > ${out}/bin/lld
{% endblock %}
