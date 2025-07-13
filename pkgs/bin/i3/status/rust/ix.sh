{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
i3status-rust
{% endblock %}

{% block version %}
0.34.0
{% endblock %}

{% block cargo_url %}
https://github.com/greshake/i3status-rust/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
bbefe6b1af93c8ae81afaab594e9c3c1e809993cc6672cf9d895e9e984742e34
{% endblock %}

{% block bld_libs %}
lib/sensors
lib/openssl
{% endblock %}

{% block cargo_features %}
{% endblock %}

{% block cargo_bins %}
i3status-rs
{% endblock %}

{% block cargo_tool %}
bld/rust/87
{% endblock %}
