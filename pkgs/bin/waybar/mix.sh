{% extends '//mix/template/meson.sh' %}

{% block fetch %}
https://github.com/Alexays/Waybar/archive/refs/tags/0.9.9.tar.gz
sha:23a94538538f43a6db4c1c5f7e09e75ab743ded1ccfc737e1f3e0971fe4cdd87
{% endblock %}

{% block bld_libs %}
lib/c
lib/nl
lib/c++
lib/fmt
lib/spdlog
lib/sigc++/2
lib/gtk/3/mm
lib/dbus/menu
lib/evdev
lib/wayland
lib/xkbcommon
lib/json/cpp
{% endblock %}

{% block bld_tool %}
lib/glib
bin/scdoc
lib/wayland/protocols
{% endblock %}
