{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
Waybar
{% endblock %}

{% block version %}
0.13.0
{% endblock %}

{% block fetch %}
https://github.com/Alexays/Waybar/archive/refs/tags/{{self.version().strip()}}.tar.gz
5148c802ecdcb459f0dbcb20b43a30f5751e9c1b2c9ed7bb893aa87f37212307
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
lib/xkb/common
lib/app/indicator
lib/gtk/layer/shell/3
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
