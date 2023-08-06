{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://github.com/limine-bootloader/limine/releases/download/v5.20230801.0/limine-5.20230801.0.tar.xz
sha:d7bd6389491ec63303dbcf77e32e77250f62bd10839278957681c1d6613d8ca6
{% endblock %}

{% block bld_libs %}
lib/c
bin/clang/lib(for_target= )
{% endblock %}

{% block host_libs %}
lib/c
bin/clang/lib
{% endblock %}

{% block bld_tool %}
bin/gzip
bin/nasm
bin/mtools
{% endblock %}

{% block c_compiler %}
bld/compiler/unwrap
{% endblock %}

{% block configure_flags %}
--enable-all
TOOLCHAIN_FOR_TARGET=llvm
{% endblock %}

{% block configure %}
sed -e 's|set -e|set -xe|' -i freestanding-toolchain
sed -e 's|cross_compiling=no|cross_compiling=yes|' -i configure
{{super()}}
{% endblock %}
