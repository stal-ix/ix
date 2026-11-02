{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
fd-find
{% endblock %}

{% block version %}
10.5.0
{% endblock %}

{% block cargo_url %}
https://github.com/sharkdp/fd/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
1ef2d0c55e4a24288d91bf6670e450497ff4bfde6302d9b1e15057bf5cb56ae2
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
