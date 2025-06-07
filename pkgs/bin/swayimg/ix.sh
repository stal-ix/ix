{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
swayimg
{% endblock %}

{% block version %}
4.1
{% endblock %}

{% block fetch %}
https://github.com/artemsen/swayimg/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:500e6a7bc37319ed600fa950cf08a61c5b96a5ad9c667a60c4f1db596b6b5b21
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
