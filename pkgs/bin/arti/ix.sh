{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://gitlab.torproject.org/tpo/core/arti/-/archive/arti-v1.4.0/arti-arti-v1.4.0.tar.bz2
{% endblock %}

{% block cargo_sha %}
e40ee1b9196018ff96f6637d692c97b5ddb7862f78b267329934109183e057b1
{% endblock %}

{% block bld_libs %}
lib/z
lib/xz
lib/zstd
lib/openssl
lib/sqlite/3
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/arti ${out}/bin/
{% endblock %}
