{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/shadowsocks/shadowsocks-rust/archive/refs/tags/v1.20.4.tar.gz
{% endblock %}

{% block cargo_sha %}
3c11e095a59024012e00d9e7d3dc4dcadc4ea5d5643fbea95104faa22ed77aab
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
