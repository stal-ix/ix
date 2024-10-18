{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/eza-community/eza/archive/refs/tags/v0.20.4.tar.gz
{% endblock %}

{% block cargo_sha %}
8232fae6ad199334bc82e5e61aa86b57944a09e83714db54e4eb93b1ac79b327
{% endblock %}

{% block bld_libs %}
lib/git/2
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/eza ${out}/bin/
{% endblock %}
