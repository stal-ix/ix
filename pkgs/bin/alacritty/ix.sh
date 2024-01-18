{% extends '//die/rust/cargo.sh' %}

{% block fetch %}
https://github.com/alacritty/alacritty/archive/refs/tags/v0.13.1.tar.gz
sha:38a42e23e1e6faaa9e300347df3f7b58b6182908a701517aac6e296fbdf37451
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
{% endblock %}

{% block bld_tool %}
bld/pkg/config
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp target/release/alacritty ${out}/bin/
{% endblock %}
