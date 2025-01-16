{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/eza-community/eza/archive/refs/tags/v0.20.17.tar.gz
{% endblock %}

{% block cargo_sha %}
983eae99c80525438dd4195fb4f6ae9f972f61d597a3c38ddd175fad2bb95d4c
{% endblock %}

{% block bld_libs %}
lib/git/2
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/eza ${out}/bin/
{% endblock %}
