{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
delta
{% endblock %}

{% block version %}
0.20.1
{% endblock %}

{% block cargo_url %}
https://github.com/dandavison/delta/archive/refs/tags/{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
1f5d72bf280ecc488877703b83bd8f160ef381571ef9d1265230c2eb11df7d32
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
bld/cargo/96
{% endblock %}
