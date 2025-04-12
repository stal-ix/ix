{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
jj
{% endblock %}

{% block version %}
0.26.0
{% endblock %}

{% block cargo_url %}
https://github.com/martinvonz/jj/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
1e9a3ae078be571ff0fff154ae7f631bc049d6e67618ef6b50ef2a60c06aae75
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
