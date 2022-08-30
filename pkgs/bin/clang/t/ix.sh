{% extends '//lib/llvm/t/ix.sh' %}

{% block task_pool %}full{% endblock %}

{% block bld_libs %}
lib/c
{% if linux %}
lib/linux
{% endif %}
{% if darwin %}
lib/darwin/framework/CoreFoundation
{% endif %}
lib/z
lib/c++
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
clang
clang-cmake-exports
clang-resource-headers

lld
lld-cmake-exports

dsymutil

llvm-ar
llvm-as
llvm-nm
llvm-dis
llvm-ranlib

llvm-install-name-tool
llvm-libtool-darwin
llvm-lipo

llvm-strip
llvm-objcopy
llvm-objdump
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
mkdir ${out}/share
mv ${out}/lib/clang/1*/include ${out}/share/
rm -rf ${out}/libexec
{% endblock %}

{% block postinstall %}
rm -rf ${out}/lib ${out}/include
{% endblock %}
