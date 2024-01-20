{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://github.com/limine-bootloader/limine/releases/download/v5.20230801.0/limine-5.20230801.0.tar.xz
sha:d7bd6389491ec63303dbcf77e32e77250f62bd10839278957681c1d6613d8ca6
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block bld_tool %}
bin/gzip
bin/mtools
{% if x86_64 %}
bld/nasm
{% endif %}
{% endblock %}

{% block setup %}
export CLANG_BINARY=$(dirname $(which llvm-addr2line))/clang
{% endblock %}

{% block configure_flags %}
--enable-uefi-{{target.gnu_arch}}
TOOLCHAIN_FOR_TARGET=llvm
CC_FOR_TARGET=${CLANG_BINARY}
{% endblock %}

{% block configure %}
sed -e 's|cross_compiling=no|cross_compiling=yes|' -i configure
{{super()}}
{% endblock %}
