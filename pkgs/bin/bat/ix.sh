{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/sharkdp/bat/archive/refs/tags/v0.24.0.tar.gz
{% endblock %}

{% block cargo_sha %}
9d2352d9054cbbcc5829ac8f0f778eb669b23a22c6a3554e46c2a67fb54a7c15
{% endblock %}

{% block bld_libs %}
lib/c
lib/iconv
lib/git/2
lib/oniguruma
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/bat ${out}/bin/
{% endblock %}
