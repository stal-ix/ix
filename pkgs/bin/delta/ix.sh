{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
delta
{% endblock %}

{% block version %}
0.21.0
{% endblock %}

{% block cargo_url %}
https://github.com/dandavison/delta/archive/refs/tags/{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
aa28cf835edadd526acc78e7be6ebe9a7d51939ffbb305ba2a29f8fd25fe3876
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
