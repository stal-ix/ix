{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
swayimg
{% endblock %}

{% block version %}
4.5
{% endblock %}

{% block fetch %}
https://github.com/artemsen/swayimg/archive/refs/tags/v{{self.version().strip()}}.tar.gz
4f0c491f873e37b85342a92d9b0ecc570a059bb971040c23075d4c3ab401680b
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
