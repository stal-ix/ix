{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://codeberg.org/dnkl/fuzzel/archive/1.9.2.tar.gz
sha:fb68a09a6f6f3dde8266177b1bef6f5c91b3bf60e9925eea7887ad2fa81d2183
{% endblock %}

{% block bld_libs %}
lib/c
lib/png
lib/cairo
lib/tllist
lib/fcft/3
lib/pixman
lib/wayland
lib/xkbcommon
{% endblock %}

{% block bld_tool %}
bin/scdoc
bld/wayland
{% endblock %}

{% block meson_flags %}
enable-cairo=enabled
png-backend=libpng
svg-backend=nanosvg
{% endblock %}
