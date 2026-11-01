{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
sway
{% endblock %}

{% block version %}
1.12
{% endblock %}

{% block fetch %}
https://github.com/swaywm/sway/archive/refs/tags/{{self.version().strip()}}.tar.gz
29ca7caac960d13e02d8213418d91a5422c7c23102a283ceab944c57c5e1efcf
{% endblock %}

{% block bld_libs %}
lib/c
lib/basu
lib/cairo
lib/pango
lib/pcre/2
lib/json/c
lib/wayland
lib/wlroots/{{wlroots_ver or '20'}}{{'(opengl=1)' if sway_wlroots_opengl else ''}}
lib/gdk/pixbuf
{% endblock %}

{% block bld_tool %}
bin/scdoc
bld/wayland
{% endblock %}

{% block c_rename_symbol %}
list_insert
seat_create
server_init
seat_destroy
parse_boolean
{% endblock %}
