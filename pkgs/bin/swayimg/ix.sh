{% extends '//die/c/meson.sh' %}

{% block version %}
3.9
{% endblock %}

{% block fetch %}
https://github.com/artemsen/swayimg/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:d21a7ca9ef4d21cf852889932999e9edd4ecf2c587321120f5b4d6147580e7cb
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
