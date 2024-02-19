{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/dandavison/delta/archive/refs/tags/0.16.5.tar.gz
{% endblock %}

{% block cargo_sha %}
515e69e0fa249bf7e34363dc60d26625ca93c4e963f1fcd905d4017a99f31fec
{% endblock %}

{% block bld_libs %}
lib/git/2
lib/oniguruma
{% endblock %}

{% block cargo_features %}
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/delta ${out}/bin/
{% endblock %}
