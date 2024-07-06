{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/mpv-player/mpv/archive/refs/tags/v0.38.0.tar.gz
sha:86d9ef40b6058732f67b46d0bbda24a074fae860b3eaae05bab3145041303066
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
