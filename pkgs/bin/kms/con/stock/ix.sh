{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
kmscon
{% endblock %}

{% block version %}
10.1.1
{% endblock %}

{% block fetch %}
https://github.com/kmscon/kmscon/archive/refs/tags/v{{self.version().strip()}}.tar.gz
0459d111eb9a12d7b8981492957043b5326a6ee91b7351575f8fd402d745eeb3
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
