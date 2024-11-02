{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/ikatson/rqbit/archive/refs/tags/v5.6.4.tar.gz
{% endblock %}

{% block cargo_sha %}
5597584d7db116b918f5a13c1d2a15b5fb1514dcc4262ac5caf841104784fbbc
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/rqbit ${out}/bin/
{% endblock %}

{% block bld_libs %}
lib/openssl
{% endblock %}
