{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
foot
{% endblock %}

{% block version %}
1.24.0
{% endblock %}

{% block fetch %}
https://codeberg.org/dnkl/foot/archive/{{self.version().strip()}}.tar.gz
db2266f1a541662187ded46648a52feb0f8761b26ef7a8360bf3ac8315321bef
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
