{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/martinvonz/jj/archive/refs/tags/v0.22.0.tar.gz
{% endblock %}

{% block cargo_sha %}
3c246836e53a57768269fd6c95fa2d68ebeab5ca760cb952e25901abfee3c509
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
cp ${tmp}/out/jj ${out}/bin/
{% endblock %}
