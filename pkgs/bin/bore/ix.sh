{% extends '//die/rust/cargo_v2.sh' %}

{% block cargo_url %}
https://github.com/ekzhang/bore/archive/refs/tags/v0.5.0.tar.gz
{% endblock %}

{% block cargo_sha %}
10a59a3d4b5f83b7a137ac98b395be40c9b05d006a4b0553e362517f1da1f3a4
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/bore ${out}/bin/
{% endblock %}
