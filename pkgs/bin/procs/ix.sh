{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
procs
{% endblock %}

{% block version %}
0.14.11
{% endblock %}

{% block cargo_url %}
https://github.com/dalance/procs/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
0cc512a33ec567b0ca230c9a4d5516baf0b41f9c9cd5057cd619efd64674f58a
{% endblock %}

{% block cargo_features %}
{% endblock %}

{% block cargo_bins %}
procs
{% endblock %}

{% block cargo_tool %}
bld/cargo/91
{% endblock %}
