{% extends '//dev/lang/clang/t/mix.sh' %}

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
