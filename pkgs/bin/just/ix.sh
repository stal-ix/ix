{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
just
{% endblock %}

{% block version %}
1.43.0
{% endblock %}

{% block cargo_url %}
https://github.com/casey/just/archive/refs/tags/{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
da10db65676f1e9884d3fc8db10a56fe6c039ec6733971bee6d66914a7f3d437
{% endblock %}

{% block cargo_bins %}
just
{% endblock %}

{% block cargo_tool %}
bld/cargo/86
{% endblock %}
