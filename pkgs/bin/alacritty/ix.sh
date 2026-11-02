{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
alacritty
{% endblock %}

{% block version %}
0.17.0
{% endblock %}

{% block cargo_url %}
https://github.com/alacritty/alacritty/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
e5e949c1f7ced31b76e67824a14f8eb3310896ea02e5812c116e0265ed1636fb
{% endblock %}

{% block cargo_ver %}
v4
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
bld/cargo/91
{% endblock %}
