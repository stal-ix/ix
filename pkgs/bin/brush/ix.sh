{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
brush
{% endblock %}

{% block version %}
0.2.21
{% endblock %}

{% block cargo_url %}
https://github.com/reubeno/brush/archive/refs/tags/brush-shell-v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
f0a80e0771ff53c247630c40925f51ecbefc6a8b2983ec233b9424562934ff66
{% endblock %}

{% block cargo_bins %}
brush
{% endblock %}

{% block cargo_tool %}
bld/cargo/87
{% endblock %}
