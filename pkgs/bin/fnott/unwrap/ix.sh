{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://codeberg.org/dnkl/fnott/archive/1.4.1.tar.gz
sha:20da05357aa83b3541b6c02bb162af10c89519602bc91fdfaa190239ce303300
{% endblock %}

{% block bld_libs %}
lib/c
lib/png
lib/dbus
lib/kernel
lib/tllist
lib/fcft/3
lib/pixman
lib/wayland
lib/freetype
lib/fontconfig
{% endblock %}

{% block bld_tool %}
bin/scdoc
bld/wayland
{% endblock %}
