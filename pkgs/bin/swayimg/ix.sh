{% extends '//die/meson.sh' %}

{% block fetch %}
https://github.com/artemsen/swayimg/archive/refs/tags/v1.7.tar.gz
sha:2bb7bde8f993396c9f2a32c2789abdf30667f3191bf6f69f9823cdc2f06aa932
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
bin/wayland/protocols
{% endblock %}

{% block meson_flags %}
jxl=enabled
{% endblock %}

{% block patch %}
sed -e 's|libjxl|jxl|' -i meson.build
{% endblock %}
