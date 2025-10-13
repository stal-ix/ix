{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
labwc
{% endblock %}

{% block version %}
0.9.2
{% endblock %}

{% block fetch %}
https://github.com/labwc/labwc/archive/refs/tags/{{self.version().strip()}}.tar.gz
637b6cf8e78321d01958af439c580d58226ebdb6c4d531981609aa1d15ce648f
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
