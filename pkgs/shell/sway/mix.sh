{% extends '//mix/template/meson.sh' %}

{% block fetch %}
https://github.com/swaywm/sway/archive/3f58f12617ca4d6a311d060081e40bf01a73c239.zip
b7a35c2ee8e6f14d1657d3b4c97b7977
{% endblock %}

{% block bld_libs %}
lib/pcre/mix.sh
lib/cairo/mix.sh
lib/pango/mix.sh
lib/json/c/mix.sh
lib/wayland/mix.sh
lib/wlroots/trunk/mix.sh
lib/mesa/drivers/gl/radeonsi/mix.sh
{% endblock %}

{% block bld_tool %}
dev/doc/scdoc/mix.sh
lib/wayland/protocols/mix.sh
dev/build/meson/better/mix.sh
{% endblock %}

{% block setup %}
export CPPFLAGS="-Dlist_insert=sway_list_insert -Dseat_create=sway_seat_create -Dseat_destroy=sway_seat_destroy -Dserver_init=sway_server_init ${CPPFLAGS}"
{% endblock %}
