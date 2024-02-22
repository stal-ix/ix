{% extends '//die/rust/cargo_v2.sh' %}

{% block cargo_url %}
https://github.com/martinvonz/jj/archive/refs/tags/v0.13.0.tar.gz
{% endblock %}

{% block cargo_sha %}
64d2420aeeb180b8343ac18fd4471a5926c5042cb480f61e63fc89e4dd0c99e0
{% endblock %}

{% block unpack %}
{{super()}}
cd cli
{% endblock %}

{% block bld_libs %}
lib/zstd
lib/git/2
lib/openssl
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/jj ${out}/bin/
{% endblock %}
