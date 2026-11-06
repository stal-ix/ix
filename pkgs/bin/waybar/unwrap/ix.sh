{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
Waybar
{% endblock %}

{% block version %}
0.16.0
{% endblock %}

{% block fetch %}
https://github.com/Alexays/Waybar/archive/refs/tags/{{self.version().strip()}}.tar.gz
ce74962053002c35e80f569298baebd6887088c80454d0ce9a2c9ca5e21e97c7
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
