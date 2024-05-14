{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/emersion/mako/archive/refs/tags/v1.9.0.tar.gz
sha:5a9f0d58ad0b3dc5bed7084934519fb86648d853b4afd4d1c0cc4a7af3a82f0c
{% endblock %}

{% block lib_deps %}
lib/c
lib/basu
lib/cairo
lib/pango
lib/kernel
lib/wayland
lib/gdk/pixbuf
{% endblock %}

{% block bld_tool %}
bin/scdoc
bld/wayland
{% endblock %}
