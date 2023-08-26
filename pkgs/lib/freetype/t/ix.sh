{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.freedesktop.org/freetype/freetype/-/archive/VER-2-13-2/freetype-VER-2-13-2.tar.bz2
sha:175f39fd796410d136451ce9637f26d359b44258c8a2005682bacb326db80478
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/png
lib/brotli
lib/bzip/2
{% endblock %}
