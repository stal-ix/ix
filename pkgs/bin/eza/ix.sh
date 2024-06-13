{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/eza-community/eza/archive/refs/tags/v0.18.18.tar.gz
{% endblock %}

{% block cargo_sha %}
f15848e1c16133c144fd81535fea52133c71579a36667d16e19adcc5107dc091
{% endblock %}

{% block bld_libs %}
lib/git/2
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/eza ${out}/bin/
{% endblock %}
