{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/shadowsocks/shadowsocks-rust/archive/refs/tags/v1.18.1.tar.gz
{% endblock %}

{% block cargo_sha %}
5f3539867497ead81df339bf0edeeb950e3ad4290fc7ebcaa7f457a3e1801e29
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

{% block cargo_ver %}
v3
{% endblock %}
