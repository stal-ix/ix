{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/artemsen/swayimg/archive/refs/tags/v1.8.tar.gz
sha:d4b4988a673522d47c38939c3406dbb72bd213f857dd6116185cd9811b887b23
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

{% block patch %}
sed -e 's|libjxl|jxl|' -i meson.build
{% endblock %}
