{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
rio
{% endblock %}

{% block version %}
0.4.10
{% endblock %}

{% block cargo_url %}
https://github.com/raphamorim/rio/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_fetch_sha %}
d5d64702763103744f1ce7419c8773119678a305887514908ae38092888c0ad2
{% endblock %}

{% block cargo_sha %}
8f797e054e63bef98162943575bfd9feb300f95fd78352ae5805faba72f1687f
{% endblock %}

{% block cargo_refine_unpack %}
# upstream .cargo/config.toml has no trailing newline and only configures
# foreign targets (wasm/apple/windows); vendoring appends to it and produces
# broken toml — drop it
rm -f .cargo/config.toml
{% endblock %}

{% block bld_tool %}
bin/glslang
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
lib/oniguruma
lib/freetype
lib/harfbuzz
lib/wayland/dl
lib/drivers/3d
lib/xkb/common/dl
lib/shim/fake(lib_name=stdc++)
{% endblock %}

{% block cargo_bins %}
rio
{% endblock %}

{% block cargo_tool %}
bld/cargo/96
{% endblock %}
