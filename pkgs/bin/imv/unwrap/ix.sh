{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
imv
{% endblock %}

{% block version %}
4.5.0
{% endblock %}

{% block fetch %}
https://git.sr.ht/~exec64/imv/archive/v{{self.version().strip()}}.tar.gz
3b11991a86942d757830015033b1c3a3cc915be2f0c20fee7bc7493be560cbcb
{% endblock %}

{% block bld_libs %}
lib/c
lib/icu
lib/heif
lib/inih
lib/jpeg
lib/cairo
lib/pango
lib/opengl
lib/ns/gif
lib/wayland
lib/freeimage
lib/drivers/3d
lib/xkb/common
# {{opengl | defined('opengl')}}
{% endblock %}

{% block bld_tool %}
bld/wayland
{% endblock %}

{% block meson_flags %}
windows=wayland
{% endblock %}
