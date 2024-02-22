{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/dandavison/delta/archive/refs/tags/0.16.5.tar.gz
{% endblock %}

{% block cargo_sha %}
4477d8b3e4fa91a2d6e0dca5fefef9cf99685bf21a39f5dcff576cafed1aef52
{% endblock %}

{% block bld_libs %}
lib/git/2
lib/oniguruma
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/delta ${out}/bin/
{% endblock %}
