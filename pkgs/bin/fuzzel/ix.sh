{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://codeberg.org/dnkl/fuzzel/archive/1.8.0.tar.gz
sha:abdd788b63f18eaeb77c4d49e63712530efd0859ed5715fbe3143df6b0874c33
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

{% block install %}
{{super()}}
{{hooks.wrap_xdg_binary('fuzzel')}}
{% endblock %}
