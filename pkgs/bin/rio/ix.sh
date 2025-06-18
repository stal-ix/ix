{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
rio
{% endblock %}

{% block version %}
0.0.34
{% endblock %}

{% block cargo_url %}
https://github.com/raphamorim/rio/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
c23821273cf81c7161433661c89aebf0c4b60bf7a163315403d58068307660fc
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
lib/drivers/3d
lib/xkb/common/dl
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/rio ${out}/bin/
{% endblock %}

{% block cargo_tool %}
bld/cargo/86
{% endblock %}
