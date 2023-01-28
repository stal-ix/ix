{% extends '//die/c/waf.sh' %}

{% block fetch %}
https://github.com/mpv-player/mpv/archive/refs/tags/v0.35.1.tar.gz
sha:41df981b7b84e33a2ef4478aaf81d6f4f5c8b9cd2c0d337ac142fc20b387d1a9
{% endblock %}

{% block lib_deps %}
lib/c
lib/ass
lib/zimg
lib/sndio
lib/ffmpeg
lib/archive
lib/uchardet
lib/placebo/4
{% endblock %}

{% block bld_tool %}
bin/waf
bld/perl
{% endblock %}

{% block waf_flags %}
--enable-sndio
{% endblock %}
