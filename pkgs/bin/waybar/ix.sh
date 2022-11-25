{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/Alexays/Waybar/archive/refs/tags/0.9.16.tar.gz
sha:37ebd7b10e32e802afe9236ea9374fabb77b1abb2c203ca6173b27dc03128096
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
bld/glib/codegen
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
