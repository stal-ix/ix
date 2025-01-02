{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/martinvonz/jj/archive/refs/tags/v0.25.0.tar.gz
{% endblock %}

{% block cargo_sha %}
bfe45536ceede66c626df0a3e59618ef3616974e7b200eca109e9aae54bad895
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
