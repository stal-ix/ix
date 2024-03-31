{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/martinvonz/jj/archive/refs/tags/v0.13.0.tar.gz
{% endblock %}

{% block cargo_sha %}
9a18ffb2a5a803564ac347ecd967a25c8ad21df6a7ee928981e32bb2938406ed
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

{% block cargo_ver %}
v3
{% endblock %}
