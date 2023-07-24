{% extends '//die/c/waf.sh' %}

{% block fetch %}
https://github.com/mpv-player/mpv/archive/refs/tags/v0.36.0.tar.gz
sha:29abc44f8ebee013bb2f9fe14d80b30db19b534c679056e4851ceadf5a5e8bf6
{% endblock %}

{% block lib_deps %}
lib/c
lib/ass
lib/zimg
lib/sndio
lib/ffmpeg
lib/archive
lib/uchardet
lib/placebo/5
{% endblock %}

{% block bld_tool %}
bin/waf
bld/perl
{% endblock %}

{% block waf_flags %}
--enable-sndio
{% endblock %}
