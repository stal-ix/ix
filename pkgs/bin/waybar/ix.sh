{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/Alexays/Waybar/archive/refs/tags/0.9.14.tar.gz
sha:45fdd17240b9d61b2f19e12ba9e9444418f0c9b511440cbc3624652a309a0ccf
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
bld/wayland
bld/glib/codegen
{% endblock %}

{% block patch1 %}
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
