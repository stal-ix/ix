{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
labwc
{% endblock %}

{% block version %}
0.9.0
{% endblock %}

{% block fetch %}
https://github.com/labwc/labwc/archive/refs/tags/{{self.version().strip()}}.tar.gz
d06f89fb2bbd4be73e7bba9fb57017054d61868fe24db361d1ded87470329e63
{% endblock %}

{% block bld_libs %}
lib/c
lib/sfdo
lib/glib
lib/xml/2
lib/pango
lib/cairo
lib/input
lib/wayland
lib/shim/x11
lib/xkb/common
lib/drivers/3d
lib/wlroots/{{self.version().strip() | field(1) | add(10)}}
{% endblock %}

{% block bld_tool %}
bld/wayland
{% endblock %}

{% block meson_flags %}
xwayland=disabled
{% endblock %}
