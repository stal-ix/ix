{% extends '//mix/meson.sh' %}

{% block fetch %}
https://github.com/Alexays/Waybar/archive/refs/tags/0.9.9.tar.gz
sha:23a94538538f43a6db4c1c5f7e09e75ab743ded1ccfc737e1f3e0971fe4cdd87
{% endblock %}

{% block bld_libs %}
lib/c
lib/nl
lib/c++
lib/fmt
lib/udev
lib/evdev
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
