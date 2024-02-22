{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/extrawurst/gitui/archive/refs/tags/v0.24.3.tar.gz
{% endblock %}

{% block cargo_sha %}
8a8ca38e8cd3a386cec33b24da0ebc2dd742e65f3e2daff18276ac7eb52a0289
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
