{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
sway
{% endblock %}

{% block version %}
1.11
{% endblock %}

{% block fetch %}
https://github.com/swaywm/sway/archive/refs/tags/{{self.version().strip()}}.tar.gz
034ec4519326d6af5275814700dde46e852c5174614109affe4c86b2fbee062a
{% endblock %}

{% block bld_libs %}
lib/c
lib/basu
lib/cairo
lib/pango
lib/pcre/2
lib/json/c
lib/wayland
lib/wlroots/19
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
