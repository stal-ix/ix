{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/swaywm/sway/archive/refs/tags/1.8-rc4.tar.gz
sha:3be8c79b84603585f2147754a284a1d9841bd6faded7905de597c6ac46b797b3
{% endblock %}

{% block bld_libs %}
lib/c
lib/basu
lib/cairo
lib/pango
lib/pcre/2
lib/json/c
lib/wayland
lib/wlroots/16
lib/gdk/pixbuf
{% endblock %}

{% block bld_tool %}
bin/scdoc
bin/glslang
bld/wayland
{% endblock %}

{% block c_rename_symbol %}
list_insert
seat_create
server_init
seat_destroy
parse_boolean
{% endblock %}
