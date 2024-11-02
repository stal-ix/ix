{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/zellij-org/zellij/archive/refs/tags/v0.40.0.tar.gz
{% endblock %}

{% block cargo_sha %}
6039ae97fc4ace6bb412283084cd0de85444612ac06287bcda6e4a0c7c01ffc3
{% endblock %}

{% block bld_libs %}
lib/curl
lib/openssl
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/zellij ${out}/bin/
{% endblock %}
