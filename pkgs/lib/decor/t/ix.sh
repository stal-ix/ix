{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.freedesktop.org/libdecor/libdecor/-/archive/0.2.0/libdecor-0.2.0.tar.bz2
sha:48a3f44f8053952a5bc6216299e259f7556e6d70b4f67545c638dae34d949434
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

{% block meson_flags %}
gtk=disabled
{% endblock %}
