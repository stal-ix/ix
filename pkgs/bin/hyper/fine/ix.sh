{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
hyperfine
{% endblock %}

{% block version %}
2.0.0
{% endblock %}

{% block cargo_url %}
https://github.com/sharkdp/hyperfine/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
b209aab1bcae395d44f921f08133b0d90c5333f602afacef17ac8a79f1cf9cf4
{% endblock %}

{% block cargo_bins %}
hyperfine
{% endblock %}

{% block cargo_tool %}
bld/cargo/97
{% endblock %}
