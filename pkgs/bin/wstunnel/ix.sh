{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
wstunnel
{% endblock %}

{% block version %}
11.0.0
{% endblock %}

{% block cargo_url %}
https://github.com/erebe/wstunnel/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
7694961b1051337beb0697d7be8ec7233ed3ade075b5dfbf84615219e8c19fd4
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
