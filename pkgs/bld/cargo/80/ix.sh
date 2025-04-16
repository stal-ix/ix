{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
cargo
{% endblock %}

{% block version %}
0.80.0
{% endblock %}

{% block cargo_url %}
https://github.com/rust-lang/cargo/archive/refs/tags/{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
4ae93f4ed09a4c2f44b631c89c906fd2ed7a85e41b9538fdfe6c897754163f87
{% endblock %}

{% block bld_libs %}
lib/curl
lib/git/2
lib/openssl
{% endblock %}

{% block cargo_bins %}
cargo
{% endblock %}
