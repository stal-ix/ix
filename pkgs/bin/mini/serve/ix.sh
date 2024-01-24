{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/svenstaro/miniserve/archive/refs/tags/v0.26.0.tar.gz
{% endblock %}

{% block cargo_sha %}
a062710e3c7c595b7221b8d43e6eb1583f4302a167acec105f1280b628dbc33e
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/miniserve ${out}/bin/
{% endblock %}
