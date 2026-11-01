{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
kmscon
{% endblock %}

{% block version %}
10.1.0
{% endblock %}

{% block fetch %}
https://github.com/kmscon/kmscon/archive/refs/tags/v{{self.version().strip()}}.tar.gz
ac8e763b3c0e88f155daa7c4273009a9042fd43b2f7d54bc95dccfab0d81d953
{% endblock %}

{% block bld_libs %}
lib/c
lib/drm
lib/tsm
lib/udev
lib/pango
lib/xkb/common
{% if opengl %}
lib/drivers/3d
{% endif %}
{% endblock %}

{% block modules %}
psf
pango
unifont
freetype
{% endblock %}

{% block meson_flags %}
tests=false
video_drm3d=disabled
renderer_gltex=disabled
{% for m in self.modules() | parse_list %}
font_{{m}}=enabled
{% endfor %}
{% endblock %}
