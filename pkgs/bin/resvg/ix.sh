{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
resvg
{% endblock %}

{% block version %}
0.49.0
{% endblock %}

{% block cargo_url %}
https://github.com/RazrFalcon/resvg/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
ee66869638f321f3e55e1875aa49882df08b389b793ff9bcb0e7a745e4be4c52
{% endblock %}

{% block unpack %}
{{super()}}
cd crates/resvg
{% endblock %}

{% block cargo_bins %}
resvg
{% endblock %}

{% block cargo_tool %}
bld/cargo/96
{% endblock %}
