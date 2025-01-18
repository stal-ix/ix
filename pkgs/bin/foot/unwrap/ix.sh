{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://codeberg.org/dnkl/foot/archive/1.20.2.tar.gz
sha:9a8832e2485923c8a79e77958c8b0357abd159dfa8958609402362da8e56c073
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

{% block c_rename_symbol %}
is_valid_utf8
{% endblock %}
