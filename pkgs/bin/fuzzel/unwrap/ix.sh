{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
fuzzel
{% endblock %}

{% block version %}
1.14.0
{% endblock %}

{% block fetch %}
https://codeberg.org/dnkl/fuzzel/archive/{{self.version().strip()}}.tar.gz
f46387b29e855990614c0b699fda99130d1406f65e5ea8b447c8f7ac4b64efe4
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
