{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/eza-community/eza/archive/refs/tags/v0.20.0.tar.gz
{% endblock %}

{% block cargo_sha %}
7d3c23c74114d507a9e490e265b901d108297840b390ef03e6decc894a26803e
{% endblock %}

{% block bld_libs %}
lib/git/2
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/eza ${out}/bin/
{% endblock %}
