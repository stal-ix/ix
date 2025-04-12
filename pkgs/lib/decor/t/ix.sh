{% extends '//die/c/meson.sh' %}

{% block version %}
0.2.2
{% endblock %}

{% block fetch %}
https://gitlab.freedesktop.org/libdecor/libdecor/-/archive/{{self.version().strip()}}/libdecor-{{self.version().strip()}}.tar.bz2
sha:943e693316300a8deb50ca5879656ac3c642e7b769dbc2d093e9919b72076bc6
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
