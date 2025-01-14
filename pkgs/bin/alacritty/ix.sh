{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/alacritty/alacritty/archive/refs/tags/v0.15.0.tar.gz
{% endblock %}

{% block cargo_sha %}
9c48ac9418ce7118a5dc06cc131881c3bb7a4bf5368c889a2271b6d2bde6e7a4
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
