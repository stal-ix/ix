{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
swaylock
{% endblock %}

{% block version %}
1.8.6
{% endblock %}

{% block fetch %}
https://github.com/swaywm/swaylock/archive/refs/tags/v{{self.version().strip()}}.tar.gz
904376fd012bfff888d042606539c677d90e11f8beeeccc50a9fe387fc41a686
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
