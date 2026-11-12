{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
resvg
{% endblock %}

{% block version %}
0.50.0
{% endblock %}

{% block cargo_url %}
https://github.com/RazrFalcon/resvg/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
2cf551fcd882b046cffee9164ad2a4ee2e6f11f079be9eb2abeccf7baef8d984
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
