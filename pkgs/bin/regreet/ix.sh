{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
ReGreet
{% endblock %}

{% block version %}
0.5.0
{% endblock %}

{% block cargo_url %}
https://github.com/rharish101/ReGreet/archive/refs/tags/{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
f3ed10a824977ca13626130167c7ff6a9d34daaa74e25804a9c4e47ce1ef45e4
{% endblock %}

{% block bld_libs %}
lib/gtk/4
{% endblock %}

{% block cargo_bins %}
regreet
{% endblock %}

{% block cargo_tool %}
bld/cargo/96
{% endblock %}
