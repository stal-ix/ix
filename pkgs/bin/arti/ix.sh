{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://gitlab.torproject.org/tpo/core/arti/-/archive/arti-v1.2.2/arti-arti-v1.2.2.tar.bz2
{% endblock %}

{% block cargo_sha %}
3d3d88f4fc11901f5e74457677615970920e7fa5c042ae631c543a64eab03629
{% endblock %}

{% block bld_libs %}
lib/z
lib/xz
lib/zstd
lib/openssl
lib/sqlite/3
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/arti ${out}/bin/
{% endblock %}
