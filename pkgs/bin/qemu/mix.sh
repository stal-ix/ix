{% extends '//mix/make.sh' %}

{% block fetch %}
https://download.qemu.org/qemu-7.0.0.tar.xz
sha:f6b375c7951f728402798b0baabb2d86478ca53d44cedbefabbe1c46bf46f839
{% endblock %}

{% block bld_libs %}
bin/kernel/17/headers
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
lib/bzip2
lib/sdl/2
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
bin/elfutils
bld/pkg/config
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block configure %}
sh ./configure \
    --prefix=${out} \
    --libexecdir=${out}/bin/{{uniq_id}} \
    --disable-plugins \
    --audio-drv-list=sdl \
    --with-coroutine=ucontext \
    --target-list="x86_64-softmmu"
{% endblock %}

{% block patch %}
sed -e 's|SDL_VIDEODRIVER|SDL_VIDEODRIVER_XXX|' -i ui/sdl2.c

find . -type f | while read l; do
    sed -e 's|-lstdc++|-lc|' -i "${l}"
done
{% endblock %}

{% block c_rename_symbol %}
buffer_init
{% endblock %}
