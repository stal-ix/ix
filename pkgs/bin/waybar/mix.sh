{% extends '//mix/meson.sh' %}

{% block fetch %}
https://github.com/Alexays/Waybar/archive/refs/tags/0.9.12.tar.gz
sha:1f3f6692de99567c43939e7ad2e96f8c6a5ef83f760ad6f77865e46a3c6811d6
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
