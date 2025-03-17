{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://codeberg.org/dnkl/foot/archive/1.21.0.tar.gz
sha:b93b196a3fbab86678c54be627557bdc7b1fc8042d99b14c4a74b149f60bcd52
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
