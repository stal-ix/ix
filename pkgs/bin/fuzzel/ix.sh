{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://codeberg.org/dnkl/fuzzel/archive/1.8.2.tar.gz
sha:2e7debba9d56a989921e0ce518a026152d9fbea33abafe384a4aad074db89de8
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
