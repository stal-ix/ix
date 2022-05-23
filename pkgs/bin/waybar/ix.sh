{% extends '//die/meson.sh' %}

{% block fetch %}
https://github.com/Alexays/Waybar/archive/refs/tags/0.9.13.tar.gz
sha:9e6553274ce3013d2be9912f975287efe4dfd38de4e335db43a73aff2a3b0a34
{% endblock %}

{% block bld_libs %}
lib/c
lib/nl
lib/c++
lib/fmt
lib/udev
lib/evdev
lib/sndio
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
bld/glib/codegen
bin/wayland/protocols
{% endblock %}

{% block patch %}
sed -e 's|.*spdlog.*asString.*what.*||' -i src/bar.cpp
{% endblock %}

{% block meson_flags %}
dbusmenu-gtk=enabled
gtk-layer-shell=enabled
rfkill=enabled
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}
