{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
jj
{% endblock %}

{% block version %}
0.28.2
{% endblock %}

{% block cargo_url %}
https://github.com/martinvonz/jj/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
867f495506342e88b1a0933b9005b41608e29c58cc5fd5e4668c84f6d5a1185b
{% endblock %}

{% block unpack %}
{{super()}}
cd cli
{% endblock %}

{% block bld_libs %}
lib/zstd
lib/git/2
lib/openssl
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/jj ${out}/bin/
{% endblock %}

{% block cargoc_ver %}
bld/cargo/86
{% endblock %}

{% block rustc_ver %}
86
{% endblock %}
