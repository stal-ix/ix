{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/rust-lang/cargo/archive/refs/tags/0.80.0.tar.gz
{% endblock %}

{% block cargo_sha %}
4ae93f4ed09a4c2f44b631c89c906fd2ed7a85e41b9538fdfe6c897754163f87
{% endblock %}

{% block bld_libs %}
lib/curl
lib/openssl
lib/git/2/old
{% endblock %}

{% block cargo_bins %}
cargo
{% endblock %}
