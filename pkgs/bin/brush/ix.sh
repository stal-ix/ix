{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
brush
{% endblock %}

{% block version %}
0.2.23
{% endblock %}

{% block cargo_url %}
https://github.com/reubeno/brush/archive/refs/tags/brush-shell-v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
3946d1c1454d0662a1a2894a90b23cae92f58a5ff04b68ea673f0a9e91069440
{% endblock %}

{% block cargo_bins %}
brush
{% endblock %}

{% block cargo_tool %}
bld/cargo/87
{% endblock %}
