{% extends '//die/rust/cargo_v2.sh' %}

{% block cargo_url %}
https://github.com/extrawurst/gitui/archive/refs/tags/v0.24.3.tar.gz
{% endblock %}

{% block cargo_sha %}
45b34ab5bee64e4717b54e67692bfc41e828f7e910ddfa7ebd5e2ce47841328c
{% endblock %}

{% block bld_libs %}
lib/c
lib/iconv
lib/git/2
lib/openssl
lib/oniguruma
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/gitui ${out}/bin/
{% endblock %}
