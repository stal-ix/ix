{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
alacritty
{% endblock %}

{% block version %}
0.15.1
{% endblock %}

{% block cargo_url %}
https://github.com/alacritty/alacritty/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
f81a8e2520eab747b6fc0f47ebcb891f8c130b25fda14c1c14e49f8cb2f17fa2
{% endblock %}

{% block bld_libs %}
lib/c
lib/png
lib/glib
lib/iconv
lib/expat
lib/brotli
lib/bzip/2
lib/pcre/2
lib/wayland
lib/freetype
lib/harfbuzz
lib/wayland/dl
lib/drivers/3d
lib/xkb/common/dl
{% endblock %}

{% block unpack %}
{{super()}}
cd alacritty
{% endblock %}

{% block cargo_features %}
wayland
{% endblock %}

{% block cargo_bins %}
alacritty
{% endblock %}

{% block cargo_tool %}
bld/cargo/86
{% endblock %}
