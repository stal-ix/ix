{% extends '//die/rust/cargo.sh' %}

{% block version %}
1.22.0
{% endblock %}

{% block cargo_url %}
https://github.com/shadowsocks/shadowsocks-rust/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
f65301254cc84fa000dce4098b5f865f20964ab7f51efbe58f4097eac2ae3d09
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
