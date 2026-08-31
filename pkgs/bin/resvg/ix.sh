{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
resvg
{% endblock %}

{% block version %}
0.48.1
{% endblock %}

{% block cargo_url %}
https://github.com/RazrFalcon/resvg/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
8a1b7627e7bceca2d559a41844c035db9bca11089112303c0470349a3724413d
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
