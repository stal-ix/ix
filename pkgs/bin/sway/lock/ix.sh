{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/swaywm/swaylock/archive/refs/tags/v1.8.0.tar.gz
sha:7efc5eb6aa2fc00a3435621fc78df5bab8afbe17f7d8815241f4fbd4bbeed7f8
{% endblock %}

{% block bld_libs %}
lib/c
lib/pam
lib/cairo
lib/wayland
lib/xkb/common
lib/gdk/pixbuf
{% endblock %}

{% block bld_tool %}
bin/scdoc
bld/wayland
{% endblock %}

{% block cpp_defines %}
HAVE_GDK_PIXBUF=1
{% endblock %}

{% block cpp_missing %}
# https://github.com/swaywm/sway/issues/5410
wayland-client-protocol.h
{% endblock %}
