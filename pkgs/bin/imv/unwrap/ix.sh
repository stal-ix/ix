{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
imv
{% endblock %}

{% block version %}
5.0.0
{% endblock %}

{% block fetch %}
https://git.sr.ht/~exec64/imv/archive/v{{self.version().strip()}}.tar.gz
fe4c954da6578d476cb6a57677d958fbc2cfeb7c5d9a3bfc5f18c9f21a7170d8
{% endblock %}

{% block bld_libs %}
lib/c
lib/icu
lib/heif
lib/inih
lib/jpeg
lib/cairo
lib/pango
lib/opengl
lib/ns/gif
lib/wayland
lib/freeimage
lib/drivers/3d
lib/xkb/common
# {{opengl | defined('opengl')}}
{% endblock %}

{% block bld_tool %}
bld/wayland
{% endblock %}

{% block meson_flags %}
windows=wayland
{% endblock %}
