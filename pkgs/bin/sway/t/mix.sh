{% extends '//mix/meson.sh' %}

{% block fetch %}
https://github.com/swaywm/sway/archive/refs/tags/1.7.tar.gz
sha:0c64536fb2883ec518e75cfb119f9300115fb49b084e3fde62b794fe2c6c8d84
{% endblock %}

{% block bld_libs %}
lib/c
lib/basu
lib/pcre
lib/cairo
lib/pango
lib/json/c
lib/wayland
lib/wlroots
lib/gdk/pixbuf
{% endblock %}

{% block bld_tool %}
bin/scdoc
bin/meson/better
bin/wayland/protocols
{% endblock %}

{% block c_rename_symbol %}
list_insert
seat_create
server_init
seat_destroy
parse_boolean
{% endblock %}
