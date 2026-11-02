{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
delta
{% endblock %}

{% block version %}
0.19.2
{% endblock %}

{% block cargo_url %}
https://github.com/dandavison/delta/archive/refs/tags/{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
ce0e78337e6268906bcbf9944efd195118add524373d64a0ad77182b3bb2e0ba
{% endblock %}

{% block cargo_ver %}
v4
{% endblock %}

{% block bld_libs %}
lib/git/2
lib/oniguruma
{% endblock %}

{% block cargo_bins %}
delta
{% endblock %}

{% block cargo_tool %}
bld/cargo/91
{% endblock %}
