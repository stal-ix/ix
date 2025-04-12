{% extends '//die/rust/cargo.sh' %}

{% block version %}
10.1.6
{% endblock %}

{% block cargo_url %}
https://github.com/erebe/wstunnel/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
ecc540ea2f35dcd5113cea04c02a0172a8fea439d97795d838f871fedeb1a592
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/wstunnel ${out}/bin/
{% endblock %}
