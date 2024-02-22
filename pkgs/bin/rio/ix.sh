{% extends '//die/rust/cargo_v2.sh' %}

{% block cargo_url %}
https://github.com/raphamorim/rio/archive/refs/tags/v0.0.34.tar.gz
{% endblock %}

{% block cargo_sha %}
c229b28ab81b245f8fd3a97f4be30604610ba9d28e870222c823c5ab229c2418
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
