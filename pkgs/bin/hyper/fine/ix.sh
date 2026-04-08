{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
hyperfine
{% endblock %}

{% block version %}
1.20.0
{% endblock %}

{% block cargo_url %}
https://github.com/sharkdp/hyperfine/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
ff2a56a76a58155ed38e77ca0258aa28d635bf26b9510bcf72566f9811e441b7
{% endblock %}

{% block cargo_bins %}
hyperfine
{% endblock %}

{% block cargo_tool %}
bld/cargo/91
{% endblock %}
