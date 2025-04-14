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
3bfff6b9e33bb5fe1fbffb97a8785fc9e9cc77f250f2168646a56ad1775c0ec1
{% endblock %}

{% block bld_libs %}
lib/openssl
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/cargo-whatfeatures ${out}/bin/
{% endblock %}
