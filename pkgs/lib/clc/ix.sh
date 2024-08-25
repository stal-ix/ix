{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/llvm/llvm-project/releases/download/llvmorg-18.1.8/libclc-18.1.8.src.tar.xz
sha:905bd59e9f810d6bd0ae6874725a8f8a3c91cb416199c03f2b98b57437cfb32e
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/llvm/18
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
