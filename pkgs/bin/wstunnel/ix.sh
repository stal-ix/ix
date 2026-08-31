{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
wstunnel
{% endblock %}

{% block version %}
10.7.0
{% endblock %}

{% block cargo_url %}
https://github.com/erebe/wstunnel/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
7899584327ff6b445612203f69e1eb1a407c29e60df32a1e4caf3367c572bdfc
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block cargo_bins %}
wstunnel
{% endblock %}

{% block cargo_tool %}
bld/rust/96
{% endblock %}
