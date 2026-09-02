{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
limine
{% endblock %}

{% block version %}
12.7.0
{% endblock %}

{% block fetch %}
https://github.com/limine-bootloader/limine/releases/download/v{{self.version().strip()}}/limine-{{self.version().strip()}}.tar.xz
8499e99b1ffac27528044a276b3f76ef7a5ee709b9cb5a971d8be39d91d64314
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
CC_FOR_TARGET=${CLANG_BINARY}
{% endblock %}

{% block configure %}
sed -e 's|cross_compiling=no|cross_compiling=yes|' -i configure
{{super()}}
{% endblock %}
