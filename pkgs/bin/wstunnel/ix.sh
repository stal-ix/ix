{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
wstunnel
{% endblock %}

{% block version %}
10.7.1
{% endblock %}

{% block cargo_url %}
https://github.com/erebe/wstunnel/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
a3604129c2d1ef78c5ea81b321339dfacf587dee7eaa8335fc0c52ece2a59cb6
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
