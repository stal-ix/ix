{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/lapce/lapce/archive/refs/tags/v0.4.2.tar.gz
{% endblock %}

{% block cargo_sha %}
98d96bf6c5a4723fce7cf73ba19f16e058480e762f5d2ffb15efb11753ae71bb
{% endblock %}

{% block bld_libs %}
lib/c
lib/zstd
lib/ssh/2
lib/git/2
lib/openssl
lib/wayland/dl
lib/mesa/gl/dl
lib/drivers/3d
lib/mesa/egl/dl
lib/xkb/common/dl
lib/tree/sitter/plugins
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/lapce ${out}/bin/
{% endblock %}
