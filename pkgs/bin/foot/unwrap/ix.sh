{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://codeberg.org/dnkl/foot/archive/1.16.1.tar.gz
sha:43df31d457ee1f30909d12875a18845e66277def32a25d9754c96995c58d179a
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
lib/fcft/3
lib/tllist
lib/pixman
lib/notify
lib/wayland
lib/freetype
lib/xkb/common
lib/fontconfig
lib/{{allocator}}/trim(delay=3,bytes=1000000)
{% endblock %}

{% block bld_tool %}
bin/tic
bin/scdoc
bld/wayland
{% endblock %}

{% block meson_flags %}
tests=false
utmp-backend=none
default-terminfo=xterm-256color
{% endblock %}
