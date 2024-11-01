{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://gitlab.torproject.org/tpo/core/arti/-/archive/arti-v1.3.0/arti-arti-v1.3.0.tar.bz2
{% endblock %}

{% block cargo_sha %}
85a520ea076ea49f91c0bdad35e6e09ae7d3ea7871b4163b3ba776e42d2f5af1
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
cp ${tmp}/release/arti ${out}/bin/
{% endblock %}
