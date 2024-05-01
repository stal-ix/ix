{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://codeberg.org/dnkl/fnott/archive/1.6.0.tar.gz
sha:fc8a0a9b75995a10afeaf3a670fb30986b21a4f48bd67a7018802de10debc83f
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
