{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
imv
{% endblock %}

{% block version %}
5.0.1
{% endblock %}

{% block fetch %}
https://git.sr.ht/~exec64/imv/archive/v{{self.version().strip()}}.tar.gz
8949c1df4b933b1d324e02ce49f1834a4b73dd25fa8103579e0ed105149e080e
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
