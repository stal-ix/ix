{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/swaywm/sway/archive/refs/tags/1.8-rc3.tar.gz
sha:ec0fdb0b2c4d5a1ee26189473cbe03988c1c1fc34fd2462c47d754d4c8ff8d0d
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
