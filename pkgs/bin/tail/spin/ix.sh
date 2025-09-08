{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
tailspin
{% endblock %}

{% block version %}
5.5.0
{% endblock %}

{% block cargo_url %}
https://github.com/bensadeh/tailspin/archive/refs/tags/{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
538e6b8faa5d5e76e06f17fb7c92df4e2e1a873f2c410eecd7e67adfc66b79cf
{% endblock %}

{% block cargo_bins %}
tspin
{% endblock %}

{% block cargo_tool %}
bld/cargo/86
{% endblock %}
