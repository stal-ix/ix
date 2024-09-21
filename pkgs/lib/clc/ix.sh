{% extends '//die/c/cmake.sh' %}

{% block fetch %}
{% include '//lib/llvm/19/ver.sh' %}
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/llvm/19
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
export LLVM_CLANG=$(command -v clang-19)
export LLVM_AS=$(command -v llvm-as)
export LLVM_LINK=$(command -v llvm-link)
export LLVM_OPT=$(command -v opt)
export LLVM_SPIRV=$(command -v llvm-spirv)
{% endblock %}

{% block cmake_flags %}
CLANG=${LLVM_CLANG}
LLVM_TOOL_clang=${LLVM_CLANG}
LLVM_CLANG=${LLVM_CLANG}
LLVM_TOOL_llvm-as=${LLVM_AS}
LLVM_AS=${LLVM_AS}
LLVM_TOOL_llvm-link=${LLVM_LINK}
LLVM_LINK=${LLVM_LINK}
LLVM_TOOL_opt=${LLVM_OPT}
LLVM_OPT=${LLVM_OPT}
LLVM_TOOL_spirv=${LLVM_SPIRV}
LLVM_SPIRV=${LLVM_SPIRV}
{% endblock %}

{% block postinstall %}
echo 'skip bc files in share/'
{% endblock %}
