{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
mpv
{% endblock %}

{% block version %}
0.41.0
{% endblock %}

{% block fetch %}
https://github.com/mpv-player/mpv/archive/refs/tags/v{{self.version().strip()}}.tar.gz
ee21092a5ee427353392360929dc64645c54479aefdb5babc5cfbb5fad626209
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
