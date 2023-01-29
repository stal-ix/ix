{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/swaywm/swaylock/archive/refs/tags/v1.7.2.tar.gz
sha:a42b456cc82bcaea9732d31e85e7d77a8ddd547759fba817e1617d8a1fd003e5
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
