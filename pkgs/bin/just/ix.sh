{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
just
{% endblock %}

{% block version %}
1.42.4
{% endblock %}

{% block cargo_url %}
https://github.com/casey/just/archive/refs/tags/{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
e879d77adfa59f0c75270737d40e5da8548231a9c6ad0839479637122725c8c7
{% endblock %}

{% block cargo_bins %}
just
{% endblock %}

{% block cargo_tool %}
bld/cargo/86
{% endblock %}
