{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/artemsen/swayimg/archive/refs/tags/v2.0.tar.gz
sha:afcf69d9c69d826e010065dd08732fc5b0c0402c26f98d977f27b77ebd2bdee1
{% endblock %}

{% block bld_libs %}
lib/c
lib/png
lib/jxl
lib/heif
lib/tiff
lib/webp
lib/jpeg
lib/avif
lib/exif
lib/cairo
lib/giflib
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
