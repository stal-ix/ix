{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.freedesktop.org/freetype/freetype/-/archive/VER-2-13-1/freetype-VER-2-13-1.tar.bz2
sha:f3e648ca3948824c7e89a60c8ed6945135821d43dea2ef06681675bd14203358
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/png
lib/brotli
lib/bzip/2
{% endblock %}
