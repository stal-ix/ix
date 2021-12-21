{% extends '//lib/llvm/t/mix.sh' %}

{% block bld_libs %}
lib/c/mix.sh
{% if target.os == 'linux' %}
lib/linux/mix.sh
{% endif %}
{% if target.os == 'darwin' %}
lib/darwin/framework/CoreFoundation/mix.sh
{% endif %}
lib/z/mix.sh
lib/c++/mix.sh
lib/compiler_rt/builtins/mix.sh
{% endblock %}

{% block ind_deps %}
dev/lang/clang/lib/mix.sh
{% endblock %}

{% block cmake_flags %}
{{super()}}
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
llvm-install-name-tool
llvm-libtool-darwin
llvm-lipo
llvm-nm
llvm-objcopy
llvm-objdump
{% endset %}

{% block ninja_build_targets %}
{{targets}}
{% endblock %}

{% block ninja_install_targets %}
{% for t in mix.parse_list(targets) %}
install-{{t}}
{% endfor %}
{% endblock %}

{% block install %}
{{super()}}

mkdir ${out}/share
mv ${out}/lib/clang/13*/include ${out}/share/
rm -rf ${out}/libexec

cd ${out}/bin

ln -sf clang-13 clang
ln -sf clang-13 clang++
ln -sf clang-13 clang-cpp

ln -sf lld ld.lld
ln -sf lld ld64.lld
ln -sf lld ld64.lld.darwinold
ln -sf lld ld64.lld.darwinnew
ln -sf lld lld-link

ln -sf llvm-objdump llvm-otool
ln -sf llvm-ar llvm-ranlib
ln -sf llvm-objcopy llvm-strip
{% endblock %}

{% block env %}
export CLANG_VERSION=13.0.0
export CPPFLAGS="-isystem ${out}/share/include \${CPPFLAGS}"
{% endblock %}
