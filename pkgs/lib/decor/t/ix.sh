{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/jadahl/libdecor/-/archive/0.1.1/libdecor-0.1.1.tar.bz2
sha:69deadfd0c77afc8122f7caa8ecf65fdd9531d2c3da9bea012a6d964f322e1c4
{% endblock %}

{% block lib_deps %}
lib/c
lib/dbus
lib/cairo
lib/pango
lib/wayland
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block bld_tool %}
bld/wayland
{% endblock %}
