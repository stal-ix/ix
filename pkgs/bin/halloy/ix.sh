{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
halloy
{% endblock %}

{% block version %}
2026.8
{% endblock %}

{% block cargo_url %}
https://github.com/squidowl/halloy/archive/refs/tags/{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
eb16b9e55724bcf3c2037e658f009c35e5b2e5bb7a8db9bfc8c02d2734c7a9fc
{% endblock %}

{% block bld_libs %}
lib/z
lib/xz
lib/zstd
lib/alsa
lib/opengl
lib/openssl
lib/wayland/dl
lib/drivers/3d
lib/xkb/common/dl
{% endblock %}

{% block cargo_bins %}
halloy
{% endblock %}

{% block cargo_tool %}
bld/rust/96
{% endblock %}
