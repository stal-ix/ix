{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/alacritty/alacritty/archive/refs/tags/v0.13.2.tar.gz
{% endblock %}

{% block cargo_sha %}
6e5e70bd4fa7b3bf09c5150190c50d6c561652ad381d41d5594b2f6a5542c002
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
