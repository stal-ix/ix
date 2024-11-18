{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/alacritty/alacritty/archive/refs/tags/v0.14.0.tar.gz
{% endblock %}

{% block cargo_sha %}
1beea1ffc3f7517ff8b078908a0cde9e3c5ee9bf4487c575cdfa4bfa756e8f85
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
cp ${tmp}/out/alacritty ${out}/bin/
{% endblock %}
