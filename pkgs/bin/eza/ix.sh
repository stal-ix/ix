{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/eza-community/eza/archive/refs/tags/v0.20.19.tar.gz
{% endblock %}

{% block cargo_sha %}
484ed2a8984f619c2a357824a04dca05b15cfeb5a6bf733d9f6c47d8fb4f2e11
{% endblock %}

{% block bld_libs %}
lib/git/2
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/eza ${out}/bin/
{% endblock %}
