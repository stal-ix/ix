{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
swayimg
{% endblock %}

{% block version %}
5.7
{% endblock %}

{% block fetch %}
https://github.com/artemsen/swayimg/archive/refs/tags/v{{self.version().strip()}}.tar.gz
22e602cba022972ccc6e9701827135282679a5a8efc818132fdf56ce40a7d6fa
{% endblock %}

{% block patch %}
# libc++ iterators are not necessarily raw pointers
sed -i -e 's/const auto\* const kit/const auto kit/' \
       -e 's/const auto\* const btnit/const auto btnit/' src/input.cpp
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
lib/lua/openresty
{% endblock %}

{% block bld_tool %}
bld/wayland
{% endblock %}

{% block meson_flags %}
jxl=enabled
{% endblock %}
