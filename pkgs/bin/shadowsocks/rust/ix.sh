{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/shadowsocks/shadowsocks-rust/archive/refs/tags/v1.20.2.tar.gz
{% endblock %}

{% block cargo_sha %}
3bf35b2f0adbe85fc2ecd1b4cd912db858f59580ca9771eef2ef17d0fe21de36
{% endblock %}

{% block bld_tool %}
bld/make
{% endblock %}

{% block install %}
mkdir ${out}/bin
make PREFIX=${out}/bin TARGET=release install
{% endblock %}

{% block patch %}
sed -e "s|target/|${tmp}/|" -i Makefile
{% endblock %}
