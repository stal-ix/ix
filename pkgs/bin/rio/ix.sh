{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/raphamorim/rio/archive/refs/tags/v0.0.34.tar.gz
{% endblock %}

{% block cargo_sha %}
8f78ecf1b0ff45fe4ab31feb58dc583b0e022353cb9bbec7b5c9e6b44dbf2969
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

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/rio ${out}/bin/
{% endblock %}
