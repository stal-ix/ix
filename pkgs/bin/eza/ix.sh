{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/eza-community/eza/archive/refs/tags/v0.20.12.tar.gz
{% endblock %}

{% block cargo_sha %}
f977cf66bc6787800733207543f97aa43a21cdcb91de48e0f23d1b215d16f68d
{% endblock %}

{% block bld_libs %}
lib/git/2
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/eza ${out}/bin/
{% endblock %}
