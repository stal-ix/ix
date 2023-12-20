{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/grub/grub-2.12.tar.xz
sha:f3c97391f7c4eaa677a78e090c7e97e6dc47b16f655f04683ebd37bef7fe0faa
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
bld/bison
bld/python
bin/binutils(for_target={{target.gnu.triplet}})
{% endblock %}

{% block setup %}
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
