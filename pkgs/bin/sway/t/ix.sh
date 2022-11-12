{% extends '//die/c/meson.sh' %}

{% block fetch %}
#https://github.com/swaywm/sway/archive/refs/tags/1.7.tar.gz
#sha:0c64536fb2883ec518e75cfb119f9300115fb49b084e3fde62b794fe2c6c8d84
https://github.com/swaywm/sway/archive/5c239eaac59f327294aceac739c6fa035456ed14.zip
sha:9c1ff479c671db9a8bbc2a56641b546a9140b7e3f9a0f93970f38b5124198944
{% endblock %}

{% block bld_libs %}
lib/c
lib/basu
lib/pcre
lib/cairo
lib/pango
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
