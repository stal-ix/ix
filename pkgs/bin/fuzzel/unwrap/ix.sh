{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
fuzzel
{% endblock %}

{% block version %}
1.14.1
{% endblock %}

{% block fetch %}
https://codeberg.org/dnkl/fuzzel/archive/{{self.version().strip()}}.tar.gz
4b8a914d7a065e34da7db4cc6ae4f02c773445e41b724b28b8b7385636b449ee
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
