{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/svenstaro/miniserve/archive/refs/tags/v0.26.0.tar.gz
{% endblock %}

{% block cargo_sha %}
06f801796df58f036d51af1847264d37f25384ece33c89c816eecbd44de4bb75
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/miniserve ${out}/bin/
{% endblock %}

{% block cargo_ver %}
v3
{% endblock %}
