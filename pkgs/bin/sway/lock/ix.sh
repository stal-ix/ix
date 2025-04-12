{% extends '//die/c/meson.sh' %}

{% block version %}
1.8.2
{% endblock %}

{% block fetch %}
https://github.com/swaywm/swaylock/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:a7ea1ad1e3689697e628d37ccffb2ac6bedb70fe51ddad27e4fb7e6849924686
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
