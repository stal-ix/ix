{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
labwc
{% endblock %}

{% block version %}
0.20.2
{% endblock %}

{% block fetch %}
https://github.com/labwc/labwc/archive/refs/tags/{{self.version().strip()}}.tar.gz
fae023b6fe022f7057556707a17cdb2d98e0138c5dffaedaa1dade975699f9e8
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
lib/wlroots/{{self.version().strip() | field(1)}}
{% endblock %}

{% block bld_tool %}
bld/wayland
{% endblock %}

{% block meson_flags %}
xwayland=disabled
{% endblock %}
