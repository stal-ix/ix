{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
just
{% endblock %}

{% block version %}
1.46.0
{% endblock %}

{% block cargo_url %}
https://github.com/casey/just/archive/refs/tags/{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
49539e99f5dedc73b75227fb6d2c51033ea11a42629a0cdd6045b8ae10644abe
{% endblock %}

{% block cargo_bins %}
just
{% endblock %}

{% block cargo_tool %}
bld/cargo/91
{% endblock %}
