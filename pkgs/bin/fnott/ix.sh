{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://codeberg.org/dnkl/fnott/archive/1.3.0.tar.gz
sha:d17d6a55a7e0d56ddfc3277fbbefa7baf4c70f02265bcb8bd72ee464e202e454
{% endblock %}

{% block bld_libs %}
lib/c
lib/png
lib/dbus
lib/kernel
lib/tllist
lib/fcft/3
lib/pixman
lib/wayland
lib/freetype
lib/fontconfig
{% endblock %}

{% block bld_tool %}
bin/scdoc
bld/wayland
{% endblock %}

{% block install %}
{{super()}}
{{hooks.wrap_xdg_binary('fnott')}}
{% endblock %}
