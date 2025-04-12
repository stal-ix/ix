{% extends '//die/rust/cargo.sh' %}

{% block version %}
0.7.0
{% endblock %}

{% block cargo_url %}
https://github.com/uutils/findutils/archive/refs/tags/{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
d387e3a3e0677362bde5a4c1bc15cc10c85942af66b12c57456cf91750f4a721
{% endblock %}

{% block bld_libs %}
lib/oniguruma
{% endblock %}

{% block cargo_bins %}
find
xargs
{% endblock %}
