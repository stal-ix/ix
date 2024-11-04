{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/zellij-org/zellij/archive/refs/tags/v0.41.0.tar.gz
{% endblock %}

{% block cargo_sha %}
36e02ada369951d2a506aa1e4dbd666c342b5d67c4056f380324a7eaeccda222
{% endblock %}

{% block bld_libs %}
lib/curl
lib/openssl
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/zellij ${out}/bin/
{% endblock %}
