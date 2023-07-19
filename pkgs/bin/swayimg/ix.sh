{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/artemsen/swayimg/archive/refs/tags/v1.12.tar.gz
sha:4617322a1ec17985770dc351eea69b42b1464f2d838eb5015314634b2a30f126
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
lib/xkbcommon
{% endblock %}

{% block bld_tool %}
bld/wayland
{% endblock %}

{% block meson_flags %}
jxl=enabled
{% endblock %}
