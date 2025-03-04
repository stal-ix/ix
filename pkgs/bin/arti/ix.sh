{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://gitlab.torproject.org/tpo/core/arti/-/archive/arti-v1.4.1/arti-arti-v1.4.1.tar.bz2
{% endblock %}

{% block cargo_sha %}
74c0b9beec842360dccb0e2eb200ce3c13d033d37c6fdf0292478e55206c72c3
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
