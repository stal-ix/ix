{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://codeberg.org/dnkl/foot/archive/1.17.0.tar.gz
sha:ab5603edad89d26e8ae543e92c72210a1fbbe7abdf15a0729664b41baed6a3b8
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
