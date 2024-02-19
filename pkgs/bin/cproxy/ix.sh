{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/NOBLES5E/cproxy/archive/refs/tags/v4.1.6.post1.tar.gz
{% endblock %}

{% block cargo_sha %}
0a370677281a837375081bfc92d92338bf00daf3043e49332268acc41702a353
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/cproxy ${out}/bin/
{% endblock %}
