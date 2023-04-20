{% extends '//die/c/configure.sh' %}

{% block fetch %}
https://download.qemu.org/qemu-8.0.0.tar.xz
sha:bb60f0341531181d6cc3969dd19a013d0427a87f918193970d9adb91131e56d0
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
lib/shim/fake(lib_name=stdc++)
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
--target-list={{for_target or target.arch + '-softmmu'}}
{% endblock %}

{% block setup %}
export CPPFLAGS="-isystem${PWD}/linux-headers ${CPPFLAGS}"
{% endblock %}

{% block patch %}
sed -e 's|SDL_VIDEODRIVER|SDL_VIDEODRIVER_XXX|' -i ui/sdl2.c
sed -e 's|.*#.*error.*||' -i include/qemu/osdep.h
cd linux-headers
ln -s asm-x86 asm
{% endblock %}

{% block c_rename_symbol %}
buffer_init
{% endblock %}
