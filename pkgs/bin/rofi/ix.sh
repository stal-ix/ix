{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/davatorium/rofi/releases/download/2.0.0-beta1/rofi-2.0.0-beta1.tar.xz
1109201a629b1b1c09a9b388a0e71610258759faf33506f00ce8146da89ac290
{% endblock %}

{% block bld_libs %}
lib/c
lib/glib
lib/cairo
lib/pango
lib/wayland
lib/xkb/common
lib/gdk/pixbuf
{% endblock %}

{% block bld_tool %}
bld/flex
bld/bison
bld/glib
bld/wayland
{% endblock %}

{% block meson_flags %}
xcb=disabled
{% endblock %}
