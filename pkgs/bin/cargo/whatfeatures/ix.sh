{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
cargo-whatfeatures
{% endblock %}

{% block version %}
0.9.13
{% endblock %}

{% block cargo_url %}
https://github.com/museun/cargo-whatfeatures/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
42af9f2ab444f483cf10a0314923056aa1feaaa43a2299463a1aa179e2f899cb
{% endblock %}

{% block bld_libs %}
lib/openssl
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/cargo-whatfeatures ${out}/bin/
{% endblock %}

{% block cargo_tool %}
bld/cargo/86
{% endblock %}
