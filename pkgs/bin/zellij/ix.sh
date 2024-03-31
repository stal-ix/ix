{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/zellij-org/zellij/archive/refs/tags/v0.39.2.tar.gz
{% endblock %}

{% block cargo_sha %}
5731d843b318ae45e87c58b9803220e2e55c31d77553bdacf4f415d918628551
{% endblock %}

{% block bld_libs %}
lib/curl
lib/openssl
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/zellij ${out}/bin/
{% endblock %}
