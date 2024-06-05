{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/extrawurst/gitui/archive/refs/tags/v0.26.3.tar.gz
{% endblock %}

{% block cargo_sha %}
625263d80b8842bec1b5d3b34b489bdd6273774a9b0fef7242b7ff08fb75fa77
{% endblock %}

{% block bld_libs %}
lib/c
lib/iconv
lib/git/2
lib/openssl
lib/oniguruma
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/fakegit
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/gitui ${out}/bin/
{% endblock %}
