{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/shadowsocks/shadowsocks-rust/archive/refs/tags/v1.18.1.tar.gz
{% endblock %}

{% block cargo_sha %}
1eada146744301a024d2b8a974eed28527e10610e6e8f1e2503f4de464e360a2
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
