{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/grub/grub-2.06.tar.xz
sha:b79ea44af91b93d17cd3fe80bdae6ed43770678a9a5ae192ccea803ebb657ee1
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/xz
lib/usb
lib/intl
lib/kernel
lib/fuse/2
lib/pciaccess
lib/device/mapper
{% endblock %}

{% block bld_tool %}
bld/flex
bld/python
bin/bison/3/6
bin/binutils(for_target={{target.gnu.triplet}})
{% endblock %}

{% block setup %}
c="$(which clang)"
d="$(dirname $(dirname ${c}))"

export TARGET_CC="${c} -isystem ${d}/share/include"
export TARGET_STRIP=$(which llvm-strip)
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
