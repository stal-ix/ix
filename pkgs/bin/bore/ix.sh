{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
bore
{% endblock %}

{% block version %}
0.6.0
{% endblock %}

{% block cargo_url %}
https://github.com/ekzhang/bore/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
9847b4774e6fb718c096febc6f3b7ce4731cb4d1f753325efae0e3891b08f5df
{% endblock %}

{% block cargo_bins %}
bore
{% endblock %}

{% block cargo_tool %}
bld/cargo/86
{% endblock %}
