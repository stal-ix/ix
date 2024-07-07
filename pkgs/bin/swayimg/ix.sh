{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/artemsen/swayimg/archive/refs/tags/v2.3.tar.gz
sha:c5bde4bee699d8379cd666a027db806fdc3dc08639fd53edbc2fcf8cffab038d
{% endblock %}

{% block bld_libs %}
lib/c
lib/png
lib/jxl
lib/gif
lib/heif
lib/tiff
lib/webp
lib/jpeg
lib/avif
lib/exif
lib/cairo
lib/wayland
lib/openexr
lib/xkb/common
{% endblock %}

{% block bld_tool %}
bld/wayland
{% endblock %}

{% block meson_flags %}
jxl=enabled
{% endblock %}
