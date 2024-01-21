{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/alacritty/alacritty/archive/refs/tags/v0.13.1.tar.gz
{% endblock %}

{% block cargo_sha %}
307521e3450eb93400d4bf76738c507da4019161b5697602e0615a7521c774f5
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

{% block bld_tool %}
bld/pkg/config
{% endblock %}

{% block unpack %}
{{super()}}
cd alacritty
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/alacritty ${out}/bin/
{% endblock %}
