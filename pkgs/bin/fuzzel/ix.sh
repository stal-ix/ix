{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://codeberg.org/dnkl/fuzzel/archive/1.8.1.tar.gz
sha:f1dcd487d1cdb9f37be2535184503c265f5df5bd2571e9e0dfc193d00fd08aa2
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
