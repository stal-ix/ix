{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/mpv-player/mpv/archive/refs/tags/v0.39.0.tar.gz
sha:2ca92437affb62c2b559b4419ea4785c70d023590500e8a52e95ea3ab4554683
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
