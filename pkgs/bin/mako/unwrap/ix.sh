{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/emersion/mako/archive/refs/tags/v1.7.1.tar.gz
sha:4312ff6bc61708115b43b967a42813374de7a2022f10c84e20127606416c3c12
{% endblock %}

{% block lib_deps %}
lib/c
lib/basu
lib/cairo
lib/pango
lib/linux
lib/wayland
lib/gdk/pixbuf
{% endblock %}

{% block bld_tool %}
bin/scdoc
bld/wayland
{% endblock %}
