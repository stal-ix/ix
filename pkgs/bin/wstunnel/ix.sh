{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/erebe/wstunnel/archive/refs/tags/v10.1.3.tar.gz
{% endblock %}

{% block cargo_sha %}
8b4077beeaba62bb87b04b04a554f4a783b15e5bc8e593e600dba76a1b683281
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/wstunnel ${out}/bin/
{% endblock %}
