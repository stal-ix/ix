{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/swaywm/sway/archive/refs/tags/1.10.tar.gz
sha:3f15f8f96238d2f7a7b44dbcd132de6c81b2c06cc3b073f195f07f7105072ccf
{% endblock %}

{% block bld_libs %}
lib/c
lib/basu
lib/cairo
lib/pango
lib/pcre/2
lib/json/c
lib/wayland
lib/wlroots/18
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
