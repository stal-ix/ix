{% extends '//die/c/cmake.sh' %}

{% block fetch %}
{% include '//lib/llvm/18/ver.sh' %}
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/llvm/18
{% endblock %}

{% block step_unpack %}
{{super()}}
cd libclc
{% endblock %}

{% block bld_tool %}
bld/python
bin/llvm/spirv
{% endblock %}

{% block setup_target_flags %}
export LLVM_CLANG=$(command -v clang-18)
export LLVM_AS=$(command -v llvm-as)
export LLVM_LINK=$(command -v llvm-link)
export LLVM_OPT=$(command -v opt)
export LLVM_SPIRV=$(command -v llvm-spirv)
{% endblock %}

{% block cmake_flags %}
LLVM_CLANG=${LLVM_CLANG}
LLVM_AS=${LLVM_AS}
LLVM_LINK=${LLVM_LINK}
LLVM_OPT=${LLVM_OPT}
LLVM_SPIRV=${LLVM_SPIRV}
{% endblock %}

{% block postinstall %}
echo 'skip bc files in share/'
{% endblock %}
