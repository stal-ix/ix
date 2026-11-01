{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
wstunnel
{% endblock %}

{% block version %}
11.1.0
{% endblock %}

{% block cargo_url %}
https://github.com/erebe/wstunnel/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
b7aa09f57c61151bdd44c0fb33e2e082ed729173c4554b0dcb1aa31c283e05f3
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
