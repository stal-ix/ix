{% extends '//die/rust/cargo2.sh' %}

{% block cargo_url %}
https://github.com/alacritty/alacritty/archive/refs/tags/v0.13.1.tar.gz
{% endblock %}

{% block cargo_sha %}
69e9ab58dfc2d9be4136df108a43205c1229923f325217e1c5619bc19885afb7
{% endblock %}

{% block fetch1 %}
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
cp target/release/alacritty ${out}/bin/
{% endblock %}
