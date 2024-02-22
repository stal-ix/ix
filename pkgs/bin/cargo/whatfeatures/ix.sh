{% extends '//die/rust/cargo_v2.sh' %}

{% block cargo_url %}
https://github.com/museun/cargo-whatfeatures/archive/refs/tags/v0.9.9.tar.gz
{% endblock %}

{% block cargo_sha %}
55cbcf6ab338dce9d1db947956d5c502b65bb12d815b17af35500957850a2976
{% endblock %}

{% block bld_libs %}
lib/openssl
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/cargo-whatfeatures ${out}/bin/
{% endblock %}
