{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/wez/wezterm/archive/refs/tags/20230712-072601-f4abf8fd.tar.gz
{% endblock %}

{% block cargo_sha %}
69e9
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
cp target/release/wezterm ${out}/bin/
{% endblock %}
