{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/Alexays/Waybar/archive/refs/tags/0.9.19.tar.gz
sha:09695c9d6ae4cf33d8e8a2c3e4ba216e5d293e2d72d4115c64c5d2612976816d
{% endblock %}

{% block bld_libs %}
lib/c
lib/nl
lib/c++
lib/fmt
lib/udev
lib/date
lib/evdev
lib/sndio
lib/input
lib/upower
lib/spdlog
lib/wayland
lib/sigc++/2
lib/gtk/3/mm
lib/json/cpp
lib/dbus/menu
lib/xkbcommon
lib/appindicator
lib/gtk/layer/shell
{% endblock %}

{% block bld_tool %}
bin/scdoc
bld/wayland
bld/glib
{% endblock %}

{% block meson_flags %}
tests=disabled
rfkill=enabled
dbusmenu-gtk=enabled
gtk-layer-shell=enabled
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block c_rename_symbol %}
list_init
list_insert
list_append
list_remove
list_empty
{% endblock %}
