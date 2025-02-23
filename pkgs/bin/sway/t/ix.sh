{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/swaywm/sway/archive/refs/tags/1.10.1.tar.gz
sha:8565ab3b359780f02b1dcb24dc48e5b6b82c64dd97ca795782c2fb4cab62457b
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
lib/vulkan/loader/dl
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
