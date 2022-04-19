{% extends '//mix/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/jadahl/libdecor/-/archive/0.1.0/libdecor-0.1.0.tar.bz2
sha:261029af49ebb6128e00b14f805fb376f5c93b584fce50c5495ee99af426ac78
{% endblock %}

{% block lib_deps %}
lib/c
lib/dbus
lib/cairo
lib/pango
lib/wayland
{% endblock %}

{% block bld_tool %}
bin/wayland/protocols
{% endblock %}
