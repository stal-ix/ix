{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/museun/cargo-whatfeatures/archive/refs/tags/v0.9.9.tar.gz
{% endblock %}

{% block cargo_sha %}
307a2fcb6b36dab511ffbb18403f16c382e0529aec7188e07158b2e007fb7de5
{% endblock %}

{% block bld_libs %}
lib/openssl
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/cargo-whatfeatures ${out}/bin/
{% endblock %}

{% block cargo_ver %}
v3
{% endblock %}
