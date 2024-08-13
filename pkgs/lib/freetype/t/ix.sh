{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.com/freetype/freetype/-/archive/VER-2-13-3/freetype-VER-2-13-3.tar.bz2
sha:2f8aa590bbb4deaf77c530b77e4c5c636ae365403b8793b9841f09faf32f3a06
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/png
lib/brotli
lib/bzip/2
{% endblock %}
