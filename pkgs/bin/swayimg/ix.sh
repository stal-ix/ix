{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
swayimg
{% endblock %}

{% block version %}
4.3
{% endblock %}

{% block fetch %}
https://github.com/artemsen/swayimg/archive/refs/tags/v{{self.version().strip()}}.tar.gz
5213a9627421eb8907cfff5b3f6d91d53597281b42e4871cebf83fc7dfc1d2a6
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
