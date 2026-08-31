{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
zellij
{% endblock %}

{% block version %}
0.45.1
{% endblock %}

{% block cargo_url %}
https://github.com/zellij-org/zellij/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
5c7a258c93f6e32f2719c5154fa941d396000ca24d6e9e90c2cc09b58e627d0d
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
