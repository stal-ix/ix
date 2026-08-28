{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
limine
{% endblock %}

{% block version %}
12.6.1
{% endblock %}

{% block fetch %}
https://github.com/limine-bootloader/limine/releases/download/v{{self.version().strip()}}/limine-{{self.version().strip()}}.tar.xz
102056a76e3cf526c0e76164780d8bbd0548982bf2b52b5833bcf1592e96bbe3
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
