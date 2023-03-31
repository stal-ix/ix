{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://codeberg.org/dnkl/fnott/archive/1.4.0.tar.gz
sha:60dad48005d212a34852f72064a61cf27d8b0e0e28a8b26fa289b806b84edb5e
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
