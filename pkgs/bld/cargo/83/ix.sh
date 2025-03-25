{% extends '//bld/cargo/80/ix.sh' %}

{% block cargo_url %}
https://github.com/rust-lang/cargo/archive/refs/tags/0.83.0.tar.gz
{% endblock %}

{% block cargo_sha %}
675a2225e82cf46ea913d637a2127c8c85c97024629beaa4b38f3cfa995931e8
{% endblock %}

{% block bld_libs %}
lib/curl
lib/git/2
lib/openssl
{% endblock %}
