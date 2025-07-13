{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
impala
{% endblock %}

{% block version %}
0.3.0
{% endblock %}

{% block cargo_url %}
https://github.com/pythops/impala/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
7ee4fbc5b22e7342e51416c3d40fd7dafe20e404aef219d7971f649f75c9363d
{% endblock %}

{% block cargo_bins %}
impala
{% endblock %}

{% block cargo_tool %}
bld/cargo/86
{% endblock %}
