{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/erebe/wstunnel/archive/refs/tags/v10.1.2.tar.gz
{% endblock %}

{% block cargo_sha %}
91ef9661c19d985e379b8ebd86bedcb2ad90fd9539ce56b3b0bb119f3558cd51
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/wstunnel ${out}/bin/
{% endblock %}
