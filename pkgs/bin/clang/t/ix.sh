{% extends '//lib/llvm/t/heavy/ix.sh' %}

{% block bld_libs %}
lib/c
lib/z
lib/c++
lib/kernel
{% if darwin %}
lib/darwin/framework/CoreFoundation
{% endif %}
{% endblock %}

{% block cmake_flags %}
{{super()}}
LLVM_ENABLE_TERMINFO=OFF
LLVM_ENABLE_PROJECTS="clang;lld;polly"
CLANG_ENABLE_STATIC_ANALYZER=OFF
CLANG_ENABLE_ARCMT=OFF
{% endblock %}

{% block cmake_srcdir %}
llvm
{% endblock %}

{% set targets %}
{% block llvm_targets %}
clang
clang-cmake-exports
clang-resource-headers

lld
lld-cmake-exports

opt

dsymutil

llvm-ar
llvm-as
llvm-nm
llvm-dis
llvm-link
llvm-ranlib

llvm-install-name-tool
llvm-libtool-darwin
llvm-lipo

llvm-strip
llvm-objcopy
llvm-objdump
{% endblock %}
{% endset %}

{% block ninja_build_targets %}
{{targets}}
{% endblock %}

{% block ninja_install_targets %}
{% for t in ix.parse_list(targets) %}
install-{{t}}
{% endfor %}
{% endblock %}

{% block env %}
export CPPFLAGS="-isystem ${out}/share/include \${CPPFLAGS}"
{% endblock %}

{% block install %}
{{super()}}
{% block clang_fix_includes %}
mkdir ${out}/share
mv ${out}/lib/clang/1*/include ${out}/share/
rm -rf ${out}/libexec
{% endblock %}
{% endblock %}

{% block postinstall %}
rm -rf ${out}/lib ${out}/include
{% endblock %}
