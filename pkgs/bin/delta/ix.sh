{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/dandavison/delta/archive/refs/tags/0.16.5.tar.gz
{% endblock %}

{% block cargo_sha %}
7a8de5688aa19858f9af8a87e75fb75f406ac9b128dfdd51c2bf7c7fe6e7ebe7
{% endblock %}

{% block bld_libs %}
lib/git/2
lib/oniguruma
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/delta ${out}/bin/
{% endblock %}

{% block cargo_ver %}
v3
{% endblock %}
