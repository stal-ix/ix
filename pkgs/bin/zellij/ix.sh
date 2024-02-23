{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/zellij-org/zellij/archive/refs/tags/v0.39.2.tar.gz
{% endblock %}

{% block cargo_sha %}
1caa273c61d5dd09989e0419f7528ab0002159494414623844989b696cf2083f
{% endblock %}

{% block bld_libs %}
lib/curl
lib/openssl
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/zellij ${out}/bin/
{% endblock %}
