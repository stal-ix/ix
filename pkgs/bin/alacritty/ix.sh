{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/alacritty/alacritty/archive/refs/tags/v0.14.0.tar.gz
{% endblock %}

{% block cargo_sha %}
f7345a72c7dc623cb09da2b4f9461d0dd0d141d69ebb5a09e6fd8f055c8b9b55
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
