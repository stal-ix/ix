{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
fd-find
{% endblock %}

{% block version %}
10.5.2
{% endblock %}

{% block cargo_url %}
https://github.com/sharkdp/fd/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
2afa3cbcbc90c2589a6c5c4ba27b60bd9b7c2702e2d9098c9cf250124697dad7
{% endblock %}

{% block cargo_ver %}
v4
{% endblock %}

{% block cargo_features %}
completions
{% endblock %}

{% block cargo_bins %}
fd
{% endblock %}

{% block cargo_tool %}
bld/cargo/96
{% endblock %}
