{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
procs
{% endblock %}

{% block version %}
0.14.12
{% endblock %}

{% block cargo_url %}
https://github.com/dalance/procs/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
b6cbd17b3cc40276473263134a8f66450aa189d4e2b8d940354206dac50f025f
{% endblock %}

{% block cargo_features %}
{% endblock %}

{% block cargo_bins %}
procs
{% endblock %}

{% block cargo_tool %}
bld/cargo/96
{% endblock %}
