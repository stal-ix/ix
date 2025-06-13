{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
limine
{% endblock %}

{% block version %}
9.3.3
{% endblock %}

{% block fetch %}
https://github.com/limine-bootloader/limine/releases/download/v{{self.version().strip()}}/limine-{{self.version().strip()}}.tar.xz
f9a27e619de7fd0b46108494d52dfbe9da7d73be4cd58fb0fdd0d1ffd7e5f84c
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

{% block setup_target_flags %}
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
