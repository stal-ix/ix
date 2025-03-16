{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/emersion/mako/archive/refs/tags/v1.10.0.tar.gz
sha:3ca44f6bb85c941a4f637a9787931c22ee9a7fe6b8039e6985baf863719b0f95
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
