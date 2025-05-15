{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libdecor
{% endblock %}

{% block version %}
0.2.3
{% endblock %}

{% block fetch %}
https://gitlab.freedesktop.org/libdecor/libdecor/-/archive/{{self.version().strip()}}/libdecor-{{self.version().strip()}}.tar.bz2
sha:704138616a96eafbe68bbd5e55df2c8adb21ae5ec165ba56b6ea1f99869167d5
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
