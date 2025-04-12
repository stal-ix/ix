{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
mpv
{% endblock %}

{% block version %}
0.40.0
{% endblock %}

{% block fetch %}
https://github.com/mpv-player/mpv/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:10a0f4654f62140a6dd4d380dcf0bbdbdcf6e697556863dc499c296182f081a3
{% endblock %}

{% block lib_deps %}
lib/c
lib/ass
lib/zimg
lib/sndio
lib/ffmpeg
lib/archive
lib/uchardet
lib/placebo/7
{% endblock %}

{% block bld_tool %}
bld/perl
{% endblock %}

{% block meson_flags %}
sndio=enabled
{% endblock %}
