{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
delta
{% endblock %}

{% block version %}
0.21.2
{% endblock %}

{% block cargo_url %}
https://github.com/dandavison/delta/archive/refs/tags/{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
e7ba917bcda890a5e55d4279d3e39a2b189e3616c771347f624e83acec993e94
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
