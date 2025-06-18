{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
cargo
{% endblock %}

{% block version %}
0.87.0
{% endblock %}

{% block cargo_url %}
https://github.com/rust-lang/cargo/archive/refs/tags/{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
31982949e65e6c16f921a329697a6e63c0a7cd6a0fb7369730dfab7da6c0e02f
{% endblock %}

{% block bld_libs %}
lib/curl
lib/git/2
{% endblock %}

{% block cargo_bins %}
cargo
{% endblock %}

{% block cargo_tool %}
bld/rust/86
{% endblock %}
