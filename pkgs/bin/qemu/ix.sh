{% extends '//die/c/configure.sh' %}

{% block fetch %}
https://download.qemu.org/qemu-7.0.0.tar.xz
sha:f6b375c7951f728402798b0baabb2d86478ca53d44cedbefabbe1c46bf46f839
#https://download.qemu.org/qemu-7.1.0-rc3.tar.xz
#sha:0806eb77e25abe163631974d8a2b30b94aa1d4ac4f3a5b794dac3425bbb728fc
{% endblock %}

{% block bld_libs %}
bin/kernel/19/headers
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
lib/sdl/deps
lib/sdl/2/image
lib/ucontext/posix
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
