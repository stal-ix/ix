{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/raphamorim/rio/archive/refs/tags/v0.0.34.tar.gz
{% endblock %}

{% block cargo_sha %}
4d0df148058032b2de78a719eecd055fd6da233036647af08b67e9160b4d74cd
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
