{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
fuzzel
{% endblock %}

{% block version %}
1.11.1
{% endblock %}

{% block fetch %}
https://codeberg.org/dnkl/fuzzel/archive/{{self.version().strip()}}.tar.gz
sha:7b22fefdada10e4658ec1f914a7296ddde73a5d20a2a1ed3c02c50bf2e701d3b
{% endblock %}

{% block bld_libs %}
lib/c
lib/png
lib/cairo
lib/kernel
lib/tllist
lib/fcft/3
lib/pixman
lib/wayland
lib/xkb/common
{% endblock %}

{% block bld_tool %}
bin/scdoc
bld/wayland
{% endblock %}

{% block meson_flags %}
enable-cairo=enabled
png-backend=libpng
svg-backend=nanosvg
{% endblock %}
