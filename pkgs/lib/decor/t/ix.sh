{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libdecor
{% endblock %}

{% block version %}
0.2.5
{% endblock %}

{% block fetch %}
https://gitlab.freedesktop.org/libdecor/libdecor/-/archive/{{self.version().strip()}}/libdecor-{{self.version().strip()}}.tar.bz2
1d0e9b3d2711dfc4edc21db3c87752a76cd62079cfad447699acda5d49b23536
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
