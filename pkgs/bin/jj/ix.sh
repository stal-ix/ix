{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/martinvonz/jj/archive/refs/tags/v0.21.0.tar.gz
{% endblock %}

{% block cargo_sha %}
0182a471fcec21f6919aa26e78c3f7956303e1de1c3919442af8766fb030ea0e
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
