{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
fd-find
{% endblock %}

{% block version %}
9.0.0
{% endblock %}

{% block cargo_url %}
https://github.com/sharkdp/fd/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
42b221a4097a21325d537c9039b276bff62bc4a01c1761d4ae6fb1b75ffa60e2
{% endblock %}

{% block cargo_features %}
completions
{% endblock %}

{% block cargo_bins %}
fd
{% endblock %}

{% block cargo_tool %}
bld/cargo/86
{% endblock %}
