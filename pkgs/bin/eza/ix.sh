{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/eza-community/eza/archive/refs/tags/v0.19.4.tar.gz
{% endblock %}

{% block cargo_sha %}
3eab07ae711623373d224f95abac26de24176edcc10d5aba9304b5c4d9b3af3a
{% endblock %}

{% block bld_libs %}
lib/git/2
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/eza ${out}/bin/
{% endblock %}
