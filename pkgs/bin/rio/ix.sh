{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/raphamorim/rio/archive/refs/tags/v0.0.34.tar.gz
{% endblock %}

{% block cargo_sha %}
7ea946d01c98b49d8f22d80ebdf155211d3530a35bf7aec32c25606637e243a8
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

{% block install %}
mkdir ${out}/bin
cp target/release/rio ${out}/bin/
{% endblock %}
