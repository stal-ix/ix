{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
swayimg
{% endblock %}

{% block version %}
4.6
{% endblock %}

{% block fetch %}
https://github.com/artemsen/swayimg/archive/refs/tags/v{{self.version().strip()}}.tar.gz
030ac867501f4d10a2d85bb47d65d51f31c75282f3805079e0aaf9ac05bfb1df
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
