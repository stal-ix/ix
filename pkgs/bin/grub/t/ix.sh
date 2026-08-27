{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
grub
{% endblock %}

{% block version %}
2.14
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/grub/grub-{{self.version().strip()}}.tar.xz
bc8d3c73535b8838d8c8e2654d73edc4e6ae8c8acdb45d5df5dc9a1547446d43
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/xz
lib/usb
lib/intl
lib/kernel
lib/fuse/2
lib/pci/access
lib/device/mapper
{% endblock %}

{% block bld_tool %}
bld/flex
bld/bison
bld/python
bin/binutils(for_target={{target.gnu.triplet}})
{% endblock %}

{% block setup_target_flags %}
c="$(which clang)"
d="$(dirname $(dirname ${c}))"
export HOST_CC=clang
export TARGET_CC="${c} -isystem ${d}/share/include"
export TARGET_STRIP=$(which llvm-strip)
{% endblock %}

{% block patch %}
>grub-core/extra_deps.lst
{% endblock %}

{% block configure_flags %}
--disable-werror
--enable-grub-mount
--enable-device-mapper
--enable-liblzma
--with-bootdir=/boot
--with-grubdir=grub
{% endblock %}

{% block postinstall %}
: need lib/grub
{% endblock %}
