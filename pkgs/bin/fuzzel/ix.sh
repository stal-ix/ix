{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://codeberg.org/dnkl/fuzzel/archive/1.7.0.tar.gz
sha:f792c9869ec2ab333e99ff49d3e94a81c7ffc45767b74ed98c63404f558a008b
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
