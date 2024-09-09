{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/svenstaro/miniserve/archive/172c321c0809198ef7cafffc81aa3f8f688c5544.zip
{% endblock %}

{% block cargo_sha %}
b4c65cc5ee685f4e574bba090a064d5c2efc807a5fb55a853a0b4ea8bca591b6
{% endblock %}

{% block bld_libs %}
lib/zstd
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/miniserve ${out}/bin/
{% endblock %}
