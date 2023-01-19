{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://git.sr.ht/~exec64/imv/archive/v4.4.0.tar.gz
sha:55431c8c27fbe82d05955f61bde38ba15febf8a7fd8f0f741e504bae0b823bcf
{% endblock %}

{% block bld_libs %}
lib/c
lib/icu
lib/heif
lib/inih
lib/cairo
lib/pango
lib/opengl
lib/ns/gif
lib/wayland
lib/xkbcommon
lib/freeimage
lib/jpeg/turbo
lib/drivers/3d
{% endblock %}

{% block bld_tool %}
bld/wayland
{% endblock %}

{% block meson_flags %}
windows=wayland
{% endblock %}
