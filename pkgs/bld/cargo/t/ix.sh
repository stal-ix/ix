{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
cargo
{% endblock %}

{% block cargo_url %}
https://github.com/rust-lang/cargo/archive/refs/tags/{{self.version().strip()}}.tar.gz
{% endblock %}

{% block bld_libs %}
lib/curl
lib/git/2
lib/openssl
{% endblock %}

{% block cargo_bins %}
cargo
{% endblock %}
