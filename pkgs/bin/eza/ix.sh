{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/eza-community/eza/archive/refs/tags/v0.18.24.tar.gz
{% endblock %}

{% block cargo_sha %}
c3f14708d9b4c247c9b42fb37b407a1f3852d353cc1d9969dd5100097942f2f6
{% endblock %}

{% block bld_libs %}
lib/git/2
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/eza ${out}/bin/
{% endblock %}
