{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/artemsen/swayimg/archive/refs/tags/v1.10.tar.gz
sha:fa20e9d5e260ca45ca3fb83343a6c7e7c93bcdb1184a99b19b630aec598f4b17
{% endblock %}

{% block bld_libs %}
lib/c
lib/png
lib/jxl
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
