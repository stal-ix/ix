{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
alacritty
{% endblock %}

{% block version %}
0.16.1
{% endblock %}

{% block cargo_url %}
https://github.com/alacritty/alacritty/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
d71a4d7df5c29d33b36f6acd0cd29c183f7174aa380b9f77e026aaa2c897b018
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
lib/display/info
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
