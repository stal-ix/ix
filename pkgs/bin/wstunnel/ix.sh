{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
wstunnel
{% endblock %}

{% block version %}
10.1.6
{% endblock %}

{% block cargo_url %}
https://github.com/erebe/wstunnel/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
f8a4f414cc905a23fdf52bed7b20b8789b02b04757ae5ec96ead1a47f238325f
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/wstunnel ${out}/bin/
{% endblock %}

{% block cargo_tool %}
bld/cargo/86
{% endblock %}
