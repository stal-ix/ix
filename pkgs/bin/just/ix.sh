{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
just
{% endblock %}

{% block version %}
1.42.3
{% endblock %}

{% block cargo_url %}
https://github.com/casey/just/archive/refs/tags/{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
547c2615e66eee39dd65f34ab049f72f2767aff3bfb8041f1ad3cd73cc9f8fdc
{% endblock %}

{% block cargo_bins %}
just
{% endblock %}

{% block cargo_tool %}
bld/cargo/86
{% endblock %}
