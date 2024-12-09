{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://gitlab.torproject.org/tpo/core/arti/-/archive/arti-v1.3.1/arti-arti-v1.3.1.tar.bz2
{% endblock %}

{% block cargo_sha %}
52229afc4c9995d77c4d6afb6e3dcef05b5a1aae68b9b4047d1357189dbf8e51
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
