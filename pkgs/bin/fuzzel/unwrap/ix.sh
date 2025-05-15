{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
fuzzel
{% endblock %}

{% block version %}
1.12.0
{% endblock %}

{% block fetch %}
https://codeberg.org/dnkl/fuzzel/archive/{{self.version().strip()}}.tar.gz
sha:7f23b86d8fc635c368c69be7227aa7f8068a6ec7d07305a33c12db259400d3e8
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
