{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/alacritty/alacritty/archive/refs/tags/v0.13.1.tar.gz
{% endblock %}

{% block cargo_sha %}
3ff513555fb790559da08b682de3a4a66144f8275b77f2525ef0dfe9d7ffcf8b
{% endblock %}

{% block cargo_refine %}
find . -type l -delete
{% endblock %}

{% block bld_libs %}
lib/c
lib/png
lib/glib
lib/iconv
lib/expat
lib/brotli
lib/pcre/2
lib/wayland
lib/freetype
lib/harfbuzz
lib/wayland/dl
lib/mesa/gl/dl
lib/drivers/3d
lib/mesa/egl/dl
lib/xkb/common/dl
{% endblock %}

{% block unpack %}
{{super()}}
cd alacritty
{% endblock %}

{% block cargo_features %}
wayland
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/alacritty ${out}/bin/
{% endblock %}
