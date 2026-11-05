{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
mpv
{% endblock %}

{% block version %}
0.42.0
{% endblock %}

{% block fetch %}
https://github.com/mpv-player/mpv/archive/refs/tags/v{{self.version().strip()}}.tar.gz
bcfebbfa2b65a6d88dc97ea18117831072373e38b5785a2afb874ed4df5070dd
{% endblock %}

{% block lib_deps %}
lib/c
lib/ass
lib/zimg
{% if linux %}
lib/sndio
{% endif %}
lib/ffmpeg
lib/archive
lib/uchardet
lib/placebo/7
{% endblock %}

{% block bld_tool %}
bld/perl
{% endblock %}

{% block meson_flags %}
{% if linux %}
sndio=enabled
{% endif %}
{% endblock %}
