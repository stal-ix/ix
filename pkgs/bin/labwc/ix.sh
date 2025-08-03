{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
labwc
{% endblock %}

{% block version %}
0.9.1
{% endblock %}

{% block fetch %}
https://github.com/labwc/labwc/archive/refs/tags/{{self.version().strip()}}.tar.gz
bf7a245d5fc5665329b3f5c9cb589eb33e658b8eb638cf4f4c9ad68f4b5979f0
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
