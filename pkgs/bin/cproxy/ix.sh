{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
cproxy
{% endblock %}

{% block version %}
4.2.2
{% endblock %}

{% block cargo_url %}
https://github.com/NOBLES5E/cproxy/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
4e95738985235007422f7e1fa65e485ff6dbdf6160da489f5d71aec8fbeeb675
{% endblock %}

{% block cargo_bins %}
cproxy
{% endblock %}

{% block cargo_tool %}
bld/cargo/86
{% endblock %}
