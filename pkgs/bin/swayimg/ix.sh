{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/artemsen/swayimg/archive/refs/tags/v3.7.tar.gz
sha:967a335cc2e62b155f0523a2a9e7592f076a5eec4828fcc6306ae165d19b8a96
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
