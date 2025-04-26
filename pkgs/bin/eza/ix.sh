{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
eza
{% endblock %}

{% block version %}
0.21.2
{% endblock %}

{% block cargo_url %}
https://github.com/eza-community/eza/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
ea92b2c3e3160ba8496ab8703050726c472f0710252e0b099695694ae6ce7139
{% endblock %}

{% block bld_libs %}
lib/git/2
{% endblock %}

{% block cargo_bins %}
eza
{% endblock %}

{% block cargoc_ver %}
bld/cargo/86
{% endblock %}
