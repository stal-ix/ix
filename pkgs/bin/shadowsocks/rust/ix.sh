{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/shadowsocks/shadowsocks-rust/archive/refs/tags/v1.21.0.tar.gz
{% endblock %}

{% block cargo_sha %}
96db69ded47bbe8b13d65b7fe41d55a4333914cd288f1c805bec6332885e0f47
{% endblock %}

{% block bld_tool %}
bld/make
{% endblock %}

{% block install %}
mkdir ${out}/bin
make PREFIX=${out}/bin TARGET={{target.rust}}/release install
{% endblock %}

{% block patch %}
sed -e "s|target/|${tmp}/|" -i Makefile
{% endblock %}
