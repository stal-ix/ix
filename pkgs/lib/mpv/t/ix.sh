{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/mpv-player/mpv/archive/refs/tags/v0.37.0.tar.gz
sha:1d2d4adbaf048a2fa6ee134575032c4b2dad9a7efafd5b3e69b88db935afaddf
{% endblock %}

{% block lib_deps %}
lib/c
lib/ass
lib/zimg
lib/sndio
lib/ffmpeg
lib/archive
lib/uchardet
lib/placebo/6
{% endblock %}

{% block bld_tool %}
bld/perl
{% endblock %}

{% block meson_flags %}
sndio=enabled
{% endblock %}
