{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://gitlab.torproject.org/tpo/core/arti/-/archive/arti-v1.2.8/arti-arti-v1.2.8.tar.bz2
{% endblock %}

{% block cargo_sha %}
4d578e90ca069371073d37a579d71411770ac4416be5fcbdebb2ca1f0b64706a
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
