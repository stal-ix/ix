{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/erebe/wstunnel/archive/refs/tags/v10.1.4.tar.gz
{% endblock %}

{% block cargo_sha %}
a07dcf54a7c2893e1ffc9aad40e72d1f9a16ac9d661513b8f138e9ad08108a54
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/wstunnel ${out}/bin/
{% endblock %}
