{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/zellij-org/zellij/archive/refs/tags/v0.39.2.tar.gz
{% endblock %}

{% block cargo_sha %}
3bd7637d6256e3de68ce5018e8702702da0bed4a43a772dd0f6f36f7c0b6b84b
{% endblock %}

{% block bld_libs %}
lib/curl
lib/openssl
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/zellij ${out}/bin/
{% endblock %}
