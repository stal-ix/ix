{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
fuzzel
{% endblock %}

{% block version %}
1.15.0
{% endblock %}

{% block fetch %}
https://codeberg.org/dnkl/fuzzel/archive/{{self.version().strip()}}.tar.gz
95b6c022fc1f1c7ab586d47c1594417cc311bf41ea8f5f8b5641478da7b5cf3b
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
