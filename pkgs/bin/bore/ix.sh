{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/ekzhang/bore/archive/refs/tags/v0.5.0.tar.gz
{% endblock %}

{% block cargo_sha %}
5afaad495162d5f82b095ca225ec845abb383248764c82976d74584119d96f99
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/bore ${out}/bin/
{% endblock %}

{% block cargo_ver %}
v3
{% endblock %}
