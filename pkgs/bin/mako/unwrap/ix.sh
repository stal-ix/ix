{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
mako
{% endblock %}

{% block version %}
1.11.0
{% endblock %}

{% block fetch %}
https://github.com/emersion/mako/archive/refs/tags/v{{self.version().strip()}}.tar.gz
72d11d3fca20a3dfbca0107ff875eace479751be0cf2ddd1dd5bafa131ac7282
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
