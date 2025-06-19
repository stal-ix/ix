{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
impala
{% endblock %}

{% block version %}
0.2.4
{% endblock %}

{% block cargo_url %}
https://github.com/pythops/impala/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
2c9694251be4bb868cbc36e1d5bdd2f82e8d805ef51ed64329378006bf494063
{% endblock %}

{% block cargo_bins %}
impala
{% endblock %}

{% block cargo_tool %}
bld/cargo/86
{% endblock %}
