{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/raphamorim/rio/archive/refs/tags/v0.0.34.tar.gz
{% endblock %}

{% block cargo_sha %}
51e7401c33baff1c0ade320d8ab413fdc03a678cb43e215b4fa811cf460b2da7
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
