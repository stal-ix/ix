{% extends '//die/meson.sh' %}

{% block fetch %}
https://github.com/swaywm/sway/archive/refs/tags/1.7.tar.gz
sha:0c64536fb2883ec518e75cfb119f9300115fb49b084e3fde62b794fe2c6c8d84
#https://github.com/swaywm/sway/archive/a3a82efbf6b5b3af840c70038b1b599ba29003ac.zip
#sha:ecbccf5cdb20ced5e04dd666ed1a94405b345c7699bd3a588f3cede5c514c23a
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
bin/glslang
bin/wayland/protocols
{% endblock %}

{% block c_rename_symbol %}
list_insert
seat_create
server_init
seat_destroy
parse_boolean
{% endblock %}
