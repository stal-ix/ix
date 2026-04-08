{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
zoxide
{% endblock %}

{% block version %}
0.9.9
{% endblock %}

{% block cargo_url %}
https://github.com/ajeetdsouza/zoxide/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
d550a59f7a84023641b969194f3b32534382493428cfc97bc517bc741010afdc
{% endblock %}

{% block cargo_bins %}
zoxide
{% endblock %}

{% block cargo_tool %}
bld/cargo/91
{% endblock %}
