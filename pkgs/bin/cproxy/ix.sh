{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
cproxy
{% endblock %}

{% block version %}
4.3.4
{% endblock %}

{% block cargo_url %}
https://github.com/NOBLES5E/cproxy/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
4e95738985235007422f7e1fa65
{% endblock %}

{% block cargo_bins %}
cproxy
{% endblock %}

{% block cargoc_ver %}
bld/cargo/86
{% endblock %}
