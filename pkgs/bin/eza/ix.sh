{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/eza-community/eza/archive/refs/tags/v0.20.6.tar.gz
{% endblock %}

{% block cargo_sha %}
fcefa6eea3029780ba219824baae6dbc84a0cdb4eddc4e64dcec79e401cd6b7c
{% endblock %}

{% block bld_libs %}
lib/git/2
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/eza ${out}/bin/
{% endblock %}
