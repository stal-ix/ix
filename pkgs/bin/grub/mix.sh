{% extends '//mix/template/autohell.sh' %}

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
lib/linux
lib/pciaccess
{% endblock %}

{% block bld_tool %}
bin/flex
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
--with-platform=efi
--disable-efiemu
--with-bootdir=/boot
--with-grubdir=grub
{% endblock %}
