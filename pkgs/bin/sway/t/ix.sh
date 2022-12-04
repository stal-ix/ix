{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/swaywm/sway/archive/refs/tags/1.8-rc2.tar.gz
sha:edfac0584c421c630fd36fc4567740b8905be522209c233409e25108b9ecf157
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
