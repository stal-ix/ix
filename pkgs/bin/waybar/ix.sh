{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/Alexays/Waybar/archive/refs/tags/0.9.15.tar.gz
sha:e74c42543d10dd44688ed469c762979c108ea7cd05d94b65b47cf42dab147f8a
{% endblock %}

{% block bld_libs %}
lib/c
lib/nl
lib/c++
lib/fmt
lib/udev
lib/evdev
lib/sndio
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
dbusmenu-gtk=enabled
gtk-layer-shell=enabled
rfkill=enabled
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}
