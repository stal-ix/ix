{% extends '//die/rust/cargo.sh' %}

{% block version %}
0.15.1
{% endblock %}

{% block cargo_url %}
https://github.com/alacritty/alacritty/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
92df8769a34e0ab2e909b1bd526517549fa7559c9849f85c50059f2dca888f34
{% endblock %}

{% block bld_libs %}
lib/c
lib/gbm
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
