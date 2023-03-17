{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/artemsen/swayimg/archive/refs/tags/v1.11.tar.gz
sha:b7853417caf3c928195107644df31ba80a906fc3ecca180db2841abbfac27736
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
lib/xkbcommon
{% endblock %}

{% block bld_tool %}
bld/wayland
{% endblock %}

{% block meson_flags %}
jxl=enabled
{% endblock %}
