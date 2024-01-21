{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/museun/cargo-whatfeatures/archive/refs/tags/v0.9.9.tar.gz
{% endblock %}

{% block cargo_sha %}
4ae37f6da413aba8ddaa03e30d7be4c7596d70be4050b5e523d917b2a6d0f6e6
{% endblock %}

{% block bld_libs %}
lib/openssl
{% endblock %}

{% block bld_tool %}
bld/pkg/config
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/cargo-whatfeatures ${out}/bin/
{% endblock %}
