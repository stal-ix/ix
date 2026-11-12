{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
zellij
{% endblock %}

{% block version %}
0.46.0
{% endblock %}

{% block cargo_url %}
https://github.com/zellij-org/zellij/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
e5c999c567654b3c29c6a67b5f0c6b7de7733560dc9728a2fdf2c113171cbd11
{% endblock %}

{% block bld_libs %}
lib/curl
lib/openssl
{% endblock %}

{% block cargo_bins %}
zellij
{% endblock %}

{% block cargo_tool %}
bld/cargo/96
{% endblock %}
