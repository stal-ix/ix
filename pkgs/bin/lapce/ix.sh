{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
lapce
{% endblock %}

{% block version %}
0.4.5
{% endblock %}

{% block cargo_url %}
https://github.com/lapce/lapce/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
1a8999ebb9048af518068857576105cdc7a1aaa2eb653c3b28f02e8e373f716f
{% endblock %}

{% block bld_libs %}
lib/c
lib/zstd
lib/ssh/2
lib/git/2
lib/openssl
lib/wayland/dl
lib/drivers/3d
lib/xkb/common/dl
lib/tree/sitter/plugins
{% endblock %}

{% block cargo_bins %}
lapce
{% endblock %}

{% block cargo_tool %}
bld/rust/91
{% endblock %}
