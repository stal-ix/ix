{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
wstunnel
{% endblock %}

{% block version %}
10.5.0
{% endblock %}

{% block cargo_url %}
https://github.com/erebe/wstunnel/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
692af079d24efd8db09fb45adedcd9a20e0e4ea34c1b4b6614f60673e421a381
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block cargo_bins %}
wstunnel
{% endblock %}

{% block cargo_tool %}
bld/rust/91
{% endblock %}
