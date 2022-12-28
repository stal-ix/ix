{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/swaywm/swaylock/archive/refs/tags/1.7.tar.gz
sha:4c4d3c3ed838c085feb0b237b9aaaabdf66cbc05e2b034b2cb5c552957e620d6
{% endblock %}

{% block bld_libs %}
lib/c
lib/pam
lib/cairo
lib/wayland
lib/xkbcommon
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
