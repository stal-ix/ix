{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/eza-community/eza/archive/refs/tags/v0.20.9.tar.gz
{% endblock %}

{% block cargo_sha %}
487874ebf191a17e9c440bfcc66faaa29795ff8e165ee5bc300d8b50c17d313c
{% endblock %}

{% block bld_libs %}
lib/git/2
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/eza ${out}/bin/
{% endblock %}
