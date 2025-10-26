{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libdecor
{% endblock %}

{% block version %}
0.2.4
{% endblock %}

{% block fetch %}
https://gitlab.freedesktop.org/libdecor/libdecor/-/archive/{{self.version().strip()}}/libdecor-{{self.version().strip()}}.tar.bz2
c3510083742e940a169bb3787ff96241167b01a7205c1ed9a9061536770dac8c
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
