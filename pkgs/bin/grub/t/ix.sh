{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
grub
{% endblock %}

{% block version %}
2.16
{% endblock %}

{% block fetch %}
https://gitlab.freedesktop.org/api/v4/projects/26558/packages/generic/source-assets/grub-{{self.version().strip()}}/grub-{{self.version().strip()}}.tar.xz
f0db0104927df0b9a48bc41b735c702936190d17eb2d73d3018fa77474a0cabe
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
sed -i 's/^#if @HAVE_SYS_CDEFS_H@$/#if 0/' grub-core/lib/gnulib/getopt-cdefs.in.h
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
