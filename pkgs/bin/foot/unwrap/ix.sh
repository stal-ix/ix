{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
foot
{% endblock %}

{% block version %}
1.25.0
{% endblock %}

{% block fetch %}
https://codeberg.org/dnkl/foot/archive/{{self.version().strip()}}.tar.gz
442a42d576ec72dd50f2d3faea8a664230a47bac79dc1eb6e7c9125ee76c130f
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
