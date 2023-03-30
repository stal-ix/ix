{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://codeberg.org/dnkl/fuzzel/archive/1.9.1.tar.gz
sha:dac5f0017aaa4e41835e9145dbdaa52a6eb1c8c61306766a9f1df3824487339a
{% endblock %}

{% block bld_libs %}
lib/c
lib/png
lib/cairo
lib/tllist
lib/fcft/3
lib/pixman
lib/wayland
lib/xkbcommon
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
