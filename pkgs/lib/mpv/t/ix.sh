{% extends '//die/c/waf.sh' %}

{% block fetch %}
https://github.com/mpv-player/mpv/archive/refs/tags/v0.35.0.tar.gz
sha:dc411c899a64548250c142bf1fa1aa7528f1b4398a24c86b816093999049ec00
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
