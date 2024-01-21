{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/sharkdp/bat/archive/refs/tags/v0.24.0.tar.gz
{% endblock %}

{% block cargo_sha %}
a33a93bc470c602a858199873b2ee03240a86176fdf850b29d3c615976211cce
{% endblock %}

{% block bld_libs %}
lib/c
lib/iconv
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/bat ${out}/bin/
{% endblock %}
