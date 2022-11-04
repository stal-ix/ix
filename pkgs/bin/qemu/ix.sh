{% extends '//die/c/configure.sh' %}

{% block fetch %}
https://download.qemu.org/qemu-7.1.0.tar.xz
sha:a0634e536bded57cf38ec8a751adb124b89c776fe0846f21ab6c6728f1cbbbe6
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/lzo
lib/ssh
lib/usb
lib/zstd
lib/glib
lib/curl
lib/intl
lib/udev
lib/ssh/2
lib/iconv
lib/sdl/2
lib/uring
lib/bzip/2
lib/nettle
lib/cap/ng
lib/pixman
lib/curses
lib/gcrypt
lib/gnutls
lib/fuse/3
lib/seccomp
lib/ucontext
lib/sdl/deps
lib/sdl/2/image
{% endblock %}

{% block bld_tool %}
bld/perl
bin/bzip2
bld/ninja
bld/python
bld/gettext
bld/elfutils
bld/pkg/config
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block configure_all_flags %}
--prefix=${out}
--libexecdir=${out}/bin/{{uniq_id}}
--disable-plugins
--audio-drv-list=sdl
--with-coroutine=ucontext
--target-list="{{target.arch}}-softmmu"
{% endblock %}

{% block setup %}
export CPPFLAGS="-I${PWD}/linux-headers ${CPPFLAGS}"
{% endblock %}

{% block patch %}
sed -e 's|SDL_VIDEODRIVER|SDL_VIDEODRIVER_XXX|' -i ui/sdl2.c
sed -e 's|.*#.*error.*||' -i include/qemu/osdep.h

find . -type f | while read l; do
    sed -e 's|-lstdc++|-lc|' -i "${l}"
done
{% endblock %}

{% block c_rename_symbol %}
buffer_init
{% endblock %}
