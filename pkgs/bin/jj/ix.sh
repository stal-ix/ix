{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/martinvonz/jj/archive/refs/tags/v0.13.0.tar.gz
{% endblock %}

{% block cargo_sha %}
6732afc55fae50df135571f9ac5b4866b42735bc944e619ab11b085beb3e662c
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
