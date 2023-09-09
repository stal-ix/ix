{% extends 't/ix.sh' %}

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
llvm-readelf

llvm-install-name-tool
llvm-libtool-darwin
llvm-lipo

llvm-strip
llvm-objcopy
llvm-objdump
{% endblock %}

{% block env %}
export CPPFLAGS="-isystem ${out}/share/include \${CPPFLAGS}"
{% endblock %}

{% block install %}
{{super()}}
{% block clang_fix_includes %}
mkdir -p ${out}/share
mv ${out}/lib/clang/1*/include ${out}/share/
rm -rf ${out}/libexec
{% endblock %}
{% endblock %}

{% block postinstall %}
rm -rf ${out}/lib ${out}/include
{% endblock %}
