{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
zoxide
{% endblock %}

{% block version %}
0.10.0
{% endblock %}

{% block cargo_url %}
https://github.com/ajeetdsouza/zoxide/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
377753db6d70fdb0b51cfa76e4880c8b8db36fc2ef395a23f22cb8cc33bc7eca
{% endblock %}

{% block cargo_bins %}
zoxide
{% endblock %}

{% block cargo_tool %}
bld/cargo/96
{% endblock %}
