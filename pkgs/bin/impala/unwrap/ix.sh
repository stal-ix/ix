{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
impala
{% endblock %}

{% block version %}
0.6.0
{% endblock %}

{% block cargo_url %}
https://github.com/pythops/impala/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
7cce81baa4b32ecef59c12051b9708d062241b5a2e01e02f9e3b80d26834b66d
{% endblock %}

{% block cargo_bins %}
impala
{% endblock %}

{% block cargo_tool %}
bld/cargo/91
{% endblock %}
