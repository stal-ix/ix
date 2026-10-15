{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
mold
{% endblock %}

{% block version %}
3.0.0
{% endblock %}

{% block cargo_url %}
https://github.com/rui314/mold/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_fetch_sha %}
1dee837e227b0c3f2661def602ef8ddc0b889ae5b1d28c1ddec5f29e08e5ceb5
{% endblock %}

{% block cargo_sha %}
7b69a72a37ab4ca09717391468d55a870a3f8705ef695b60c1155740a7f5f6d5
{% endblock %}

{% block bld_libs %}
lib/z
lib/zstd
{% endblock %}

{% block ld_flags %}
-lz
-lzstd
{% endblock %}

{% block cargo_features %}
__default__
system-allocator
{% endblock %}

{% block cargo_bins %}
mold
{% endblock %}

{% block install %}
PREFIX=${out} CARGO_TARGET_DIR=${tmp}/{{target.rust}} ./install-mold.sh
{% endblock %}

{% block cargo_tool %}
bld/cargo/96
{% endblock %}
