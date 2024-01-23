{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/museun/cargo-whatfeatures/archive/refs/tags/v0.9.9.tar.gz
{% endblock %}

{% block cargo_sha %}
df5e98f33b2ee309138dcdffeaeba3086f706c465a5a0d676bf9b4ede11a52d2
{% endblock %}

{% block bld_libs %}
lib/openssl
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/cargo-whatfeatures ${out}/bin/
{% endblock %}
