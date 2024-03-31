{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/eza-community/eza/archive/refs/tags/v0.18.5.tar.gz
{% endblock %}

{% block cargo_sha %}
d6448dd5176c77077af820bde3fc2386b2785895b704b0a7b818abffacbd5f39
{% endblock %}

{% block bld_libs %}
lib/git/2
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/eza ${out}/bin/
{% endblock %}

{% block cargo_ver %}
v3
{% endblock %}
