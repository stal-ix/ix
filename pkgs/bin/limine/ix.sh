{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
limine
{% endblock %}

{% block version %}
12.11.0
{% endblock %}

{% block fetch %}
https://github.com/limine-bootloader/limine/releases/download/v{{self.version().strip()}}/limine-{{self.version().strip()}}.tar.xz
3c6e61c76badc70e1077cddd402e901721fdfae5756ce272f07ee54f109aa45d
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
