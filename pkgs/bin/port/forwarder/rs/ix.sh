{% extends '//die/rust/cargo.sh' %}

{% block version %}
0.1.0
{% endblock %}

{% block cargo_url %}
https://github.com/pzmarzly/portforwarder-rs/archive/refs/tags/{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
ab3a898c3fffb21cf7a56ae4ce3196c6f1fe9be0ea40d0aa751ea1de4a365b36
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/pf ${out}/bin/
{% endblock %}
