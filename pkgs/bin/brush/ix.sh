{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
brush
{% endblock %}

{% block version %}
0.2.20
{% endblock %}

{% block cargo_url %}
https://github.com/reubeno/brush/archive/refs/tags/brush-shell-v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
0a5c974b98b58454cf59e9525e8b2d46f208feccc221570240d0a7162730f19b
{% endblock %}

{% block cargo_bins %}
brush
{% endblock %}

{% block cargo_tool %}
bld/cargo/87
{% endblock %}
