{% extends '//die/rust/cargo_v2.sh' %}

{% block cargo_url %}
https://github.com/shadowsocks/shadowsocks-rust/archive/refs/tags/v1.18.1.tar.gz
{% endblock %}

{% block cargo_sha %}
38f304ef9005af50263154676df1ef32c4272406538ad4ab3c95856de569e9e8
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
