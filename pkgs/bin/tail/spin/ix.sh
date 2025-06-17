{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
tailspin
{% endblock %}

{% block version %}
5.4.5
{% endblock %}

{% block cargo_url %}
https://github.com/bensadeh/tailspin/archive/refs/tags/{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
5bda95a1c38a2034ae577ed1014d207b7626b1b7c02c1ea5f6cc04425896f6f9
{% endblock %}

{% block cargo_bins %}
tspin
{% endblock %}

{% block cargo_tool %}
bld/cargo/86
{% endblock %}
